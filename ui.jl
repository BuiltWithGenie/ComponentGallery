#= link(rel="stylesheet", type="text/css", href="/tailwind.min.css") =#
#= link(rel="stylesheet", type="text/css", href="/github.min.css") =#
#= script(src="/highlight.min.js") =#
StippleUI.layout(style="max-width:1400px;",
    [
        quasar(:header, toolbar(
            [
            btn(; dense=true, flat=true, round=true, icon="menu", @click("left_drawer_open = !left_drawer_open")),
            toolbartitle("Genie Component Gallery")
        ],
        ),
        ),
        drawer(bordered="", fieldname="left_drawer_open", side="left",
            list(bordered=true, separator=true, [
                item(clickable="", vripple="", @click("selected_component = 'checkbox'"), itemsection("Checkbox")),
                item(clickable="", vripple="", @click("selected_component = 'inputs'"), itemsection("Inputs")),
                item(clickable="", vripple="", @click("selected_component = 'radio'"), itemsection("Radio")),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'sliders'", itemsection("Slider")),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'select'", itemsection("Select")),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'table'", itemsection("Table")),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'toggles'", itemsection("Toggle")),
            ])
        ),
        page_container(style="margin-left:50px",
            [
                Html.div(class="", @iif("selected_component == 'checkbox'"), [
                    form_card(Checkbox, "Checkbox"),
                    form_card(CheckboxMultiple, "Multiple checkboxes"),
                    docs_card(@doc checkbox)
                ]),
                Html.div(class="", @iif("selected_component == 'inputs'"), [
                    form_card(TextInput, "Text input"),
                    form_card(TextInputPassword, "Text input password"),
                    form_card(TextInputMask, "Text input mask"),
                    form_card(TextInputValidation, "Text input validation"),
                    docs_card(@doc textfield)
                ]),
                Html.div(class="", @iif("selected_component == 'radio'"), [
                    form_card(Radio, "Radio"),
                    form_card(RadioColor, "Colored radio"),
                    docs_card(@doc radio)
                ]),
                Html.div(class="", @iif("selected_component == 'sliders'"), [
                    form_card(Slider, "Slider"),
                    form_card(SliderIcon, "Slider with an icon"),
                    docs_card(@doc slider)
                    #= form_card(SliderMarkers, "Slider with markers") =#
                ]),
                Html.div(class="", @iif("selected_component == 'select'"), [
                    form_card(Select, "Select"),
                    form_card(SelectClearable, "Clearable select with input"),
                    form_card(SelectMultiple, "Multiple choices with chips"),
                    docs_card(@doc select)
                ]),
                Html.div(class="", @iif("selected_component == 'table'"), [
                    form_card(Table, "Table"),
                    form_card(TablePagination, "Table pagination"),
                    form_card(TableSearch, "Table with search"),
                    form_card(TableGrid, "Table grid layout"),
                    docs_card(@doc table)
                ]),
                Html.div(class="", @iif("selected_component == 'toggles'"), [
                    form_card(Toggle, "Toggle"),
                    form_card(ToggleValue, "Toggle with custom true/false value"),
                    form_card(ToggleMultiple, "Multiple toggles"),
                    docs_card(@doc toggle)
                ]),
            ]),
    ],
    view="hHh lpR fFf",
    class="window-height",
)



