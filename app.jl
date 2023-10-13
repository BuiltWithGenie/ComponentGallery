using GenieFramework
include("Components.jl")
using .Components: Component, variables, handlers, ui
for f in readdir("components")
    includet("components/$f")
end
@genietools

@app begin
    @in left_drawer_open = true
    @in selected_component = "input"
end

function docs_card(f::Function)
    @show f
    docs = (@doc checkbox).content[1]
    @show d
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
                        pre(code(class="language-julia", style="white-space: pre-wrap; overflow-wrap: break-word;",
                            ui(c, "jl")
                        ))),
                    tabpanel(name="html",
                        pre(code(class="language-html", style="white-space: pre-wrap; overflow-wrap: break-word;",
                            replace(prettify(ui(c, "html")), ">" => "&gt", "<" => "&lt")
                        )))
                ])
            ]))
    ])
end


@page("/", "ui.jl", layout = "layout.html")

