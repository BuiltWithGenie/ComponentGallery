link(rel="stylesheet", type="text/css", href="/tailwind.min.css")
#= link(rel="stylesheet", type="text/css", href="/github.min.css") =#
#= script(src="/highlight.min.js") =#
StippleUI.layout(
[
        quasar(:header, toolbar(
        [
                btn(; dense=true, flat=true, round=true, icon="menu", @click("left_drawer_open = !left_drawer_open")),
                toolbartitle("Genie Component Gallery")
            ],
        ),
        ),
        drawer(bordered = "", fieldname = "left_drawer_open", side = "left",
            list(bordered = "", [
                item(clickable = "", vripple = "", @click("selected_component = 'inputs'"), itemsection( "Inputs")),
                    item(clickable = "", vripple = "", var"v-on:click" = "selected_component = 'sliders'", itemsection( "Sliders")),
                    item(clickable = "", vripple = "", var"v-on:click" = "selected_component = 'toggles'", itemsection( "Toggles")),
            ])
        ),
        page_container(
        [
                Html.div(class="", @iif("selected_component == 'inputs'"), [
                    form_card(TextInput, "Text input"),
                    form_card(TextInputPassword, "Text input password"),
                    form_card(TextInputMask, "Text input mask"),
                    form_card(TextInputValidation, "Text input validation")]),

                Html.div(class="", @iif("selected_component == 'sliders'"), [
                    form_card(Slider, "Slider"),
                    form_card(SliderIcon, "Slider with an icon"),
                    form_card(SliderMarkers, "Slider with markers")
                ]),
                Html.div(class="", @iif("selected_component == 'toggles'"), [
                    form_card(Toggle, "Toggle"),
                    form_card(ToggleLabel, "Toggle with label"),
                ]) 
            ]),
    ],
    view="hHh lpR fFf",
    class="window-height"
)



