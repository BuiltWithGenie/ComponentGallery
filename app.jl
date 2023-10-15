using GenieFramework, Highlights, JuliaFormatter
using DataFrames: DataFrame
include("Components.jl")
using .Components: Component, variables, handlers, ui
for f in readdir("components")
    include("components/$f")
end
@genietools

@app begin
    @in left_drawer_open = true
    @in selected_component = "input"
end

# it'd be easier to pass the function to the docs_card function as a parameter `f`, but calling @doc f from insinde `docs_card` yields "no documentation found"
function docs_card(docs)
    docs = string(docs.content[1])
    docs = highlight_markdown_code_blocks(docs)
    card(class="q-pa-md q-mt-md p-5 mt-5", [h1("Docstring"), "<md-block>  $docs </md-block>"])
end

function form_card(code, title="")
    card(style="margin-top:10px;padding:15px", [h4(title), code])
end

function form_card(c::Component, title="", M=@__MODULE__)
    tabname = Symbol(string(c.prefix, "tab"))

    eval(:(@in $tabname = "julia"))
    Html.div(class="flex", [
        card(style="margin-top:10px;padding:15px;width:50%", [h4(title), c(M=M)]),
        Html.div(style="width:50%", class="p-2",
            card(class="q-pa-md", style="margin-top:10px; margin-left:10px", [
                quasar(:tabs, fieldname=Symbol(tabname), class="bg-primary text-white", [
                    tab(name="julia", label="Julia",),
                    tab(name="html", label="HTML",)
                ]),
                tabpanelgroup(Symbol(tabname), animated="", [
                    tabpanel(name="julia",
                        #= pre(code(class="language-julia", style="white-space: pre-wrap; overflow-wrap: break-word;", =#
                        highlight_code(ui(c, "jl"))
                        #= )) =#
                    ),
                    tabpanel(name="html",
                        pre(code(class="language-html", style="white-space: pre-wrap; overflow-wrap: break-word;",
                            replace(prettify(ui(c, "html")), ">" => "&gt", "<" => "&lt")
                        )))
                ])
            ]))
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

