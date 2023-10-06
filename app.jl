using GenieFramework
include("Components.jl")
using .Components: Component, variables, handlers, ui
include("components/Slider.jl")
include("components/SliderIcon.jl")
include("components/SliderMarkers.jl")
include("components/FilePicker.jl")
include("components/TextInput.jl")
include("components/TextInputPassword.jl")
include("components/TextInputMask.jl")
include("components/TextInputValidation.jl")
include("components/Toggle.jl")
include("components/ToggleLabel.jl")
@genietools

@app begin
    @in left_drawer_open = false
    @in selected_component = "input"
    @out tab = "html"
    variables(Slider, @__MODULE__)
    variables(SliderIcon, @__MODULE__)
    variables(SliderMarkers, @__MODULE__)
    variables(FilePicker, @__MODULE__)
    variables(TextInput, @__MODULE__)
    variables(TextInputPassword, @__MODULE__)
    variables(TextInputMask, @__MODULE__)
    variables(TextInputValidation, @__MODULE__)
    variables(Toggle, @__MODULE__)
    variables(ToggleLabel, @__MODULE__)
end
handlers(SliderMarkers, @__MODULE__)
handlers(FilePicker, @__MODULE__)
handlers(TextInput, @__MODULE__)
handlers(TextInputValidation, @__MODULE__)

function form_card(code, title="")
    card(style="margin-top:10px;padding:15px", [h4(title), code])
end
function form_card(c::Component, title="")
    tabname = Symbol(string(c.prefix, "tab"))

    eval(:(@in $tabname = "html"))

    Html.div(class="flex", [
        card(style="margin-top:10px;padding:15px;width:50%", [h4(title), ui(c)]),
        Html.div(style="width:50%", class="p-2",
            card(class="q-pa-md", [
                quasar(:tabs, fieldname=Symbol(tabname), class="bg-primary text-white", [
                    tab(name="html", label="HTML",),
                    tab(name="julia", label="Julia",)
                ]),
                tabpanelgroup(Symbol(tabname), animated="", [
                    tabpanel(name="html",
                        pre(code(class="html", style="white-space: pre-wrap; overflow-wrap: break-word;",
                            replace(prettify(ui(c)), ">" => "&gt", "<" => "&lt")
                        ))),
                    tabpanel(name="julia",
                        pre(code(class="julia", style="white-space: pre-wrap; overflow-wrap: break-word;",
                            replace(string(c.ui), ">" => "&gt", "<" => "&lt")
                        )))
                ])
            ]))
    ])
end

@page("/", "ui.jl")

