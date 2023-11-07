using GenieFramework, Highlights, JuliaFormatter
using DataFrames: DataFrame
include("Components.jl")
include("utils.jl")
using .Components: Component, variables, handlers, ui, get_code
@genietools

@app begin
    @in left_drawer_open = true
    @in ministate = true
    @in selected_component = "button"
end

# load components
for f in readdir("components")
    component = include("components/$f")
    @show component(Main)
    M = @__MODULE__
    Base.eval(M, component.variables)
    Base.eval(M, component.handlers)
    tabname = Symbol(string(component.prefix, "tab"))
    eval(:(@in $tabname = "julia"))
end

# it'd be easier to pass the function to the docs_card function as a parameter `f`, but calling @doc f from insinde `docs_card` yields "no documentation found"
function docs_card(docs)
    docs = string(docs.content[1])
    docs = highlight_markdown_code_blocks(docs)
    # setting a key is necessary to force the page to re-render the md-block component when the tab changes. otherwise a page reload is needed
    card(class="q-pa-md q-mt-md p-5 mt-5", [h1("Docstring"), "<md-block :key='$(string(randn(10)))'>  $docs </md-block>"])
end

function form_card(code, title="")
    card(style="margin-top:10px;padding:15px", [h4(title), code])
end


function form_card(c::Component, title="", M=@__MODULE__)
    reactive_code = ""
    if !is_empty(c.variables) || !is_empty(c.handlers)
        reactive_code = join(["@app begin\n", get_code(c, :variables) * "\n", get_code(c, :handlers) * " ", "end"])
    end

    tabname = Symbol(string(c.prefix, "tab"))
    Html.div(class="flex", [
        card(style="margin-top:10px;padding:15px;width:100%", [h4(title), Html.div(class="q-pl-sm q-pr-sm", ui(c)),
            expansionitem(class="q-mt-lg", label="Show code", dense=true, var"dense-toggle"=true, var"expand-separator"=true, var"header-class"="bg-blue-grey-1",
                [
                    quasar(:tabs, fieldname=Symbol(tabname), dense=true, align="left", style="background:white", class="text-black", [
                        tab(name="julia", label="Julia",),
                        tab(name="html", label="HTML",)
                    ]),
                    tabpanelgroup(Symbol(tabname), animated="", [
                        tabpanel(name="julia", [pre(var"v-pre"=true, code(class="language-julia", style="overflow:auto", highlight_code(get_code(c, :ui, "jl"))
                            )),
                            (reactive_code == "" ? "" :
                             expansionitem(label="Reactive code", dense=true, var"dense-toggle"=true, var"expand-separator"=true, var"header-class"="bg-grey-1",
                                pre(var"v-pre"=true, code(class="language-julia", style="white-space: pre-wrap; overflow-wrap: break-word;",
                                    highlight_code(reactive_code)
                                )))),
                        ]
                        ),
                        tabpanel(name="html",
                            pre(var"v-pre"=true, code(class="language-html", style="overflow:auto",
                                replace(prettify(ui(c, "html")), ">" => "&gt", "<" => "&lt")
                            )))
                    ])
                ])])
    ])
end

function highlight_code(code)
    code = format_text(code)
    buf = IOBuffer()
    highlight(buf, MIME("text/html"), code, Lexers.JuliaLexer, Themes.GitHubTheme)
    return String(take!(buf))
end

function highlight_markdown_code_blocks(markdown::String)
    # Regular expression to match code blocks
    code_block_regex = r"```[\s\S]*?```"

    # Function to replace matched code blocks with highlighted versions
    replacer(m::SubString{String}) = begin
        # Extract the content between the triple backticks
        firstbreak = findfirst("\n", m)[1] # get line break idx to remove ```julia
        code = String(strip(m[firstbreak:end-3]))
        # Highlight the extracted code
        highlighted_code = highlight_code(code)
        # Return the highlighted code wrapped with triple backticks
        return highlighted_code
    end

    # Replace code blocks in markdown text
    highlighted_markdown = replace(markdown, code_block_regex => replacer)

    return highlighted_markdown
end

@page("/", "ui.jl", layout = "layout.html")

