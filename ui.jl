#= link(rel="stylesheet", type="text/css", href="/tailwind.min.css") =#
#= link(rel="stylesheet", type="text/css", href="/github.min.css") =#
#= script(src="/highlight.min.js") =#
StippleUI.layout(style="margin:auto;max-width:800px",
    [
        quasar(:header, style="background:darkblue", toolbar(
            [
            btn(; dense=true, flat=true, round=true, icon="menu", @click("left_drawer_open = !left_drawer_open")),
            toolbartitle("Genie Component Gallery")
        ],
        ),
        ),
        drawer(bordered="", fieldname="left_drawer_open", side="left", var":mini"="ministate", var"@mouseover"="ministate = false", var"@mouseout"="ministate = true", var"mini-to-overlay"=true, width="170", breakpoint="200",
            list(bordered=true, separator=true, [
                item(clickable="", vripple="", @click("selected_component = 'badge'"), [itemsection(avatar=true, icon("badge")), itemsection("Badge")]),
                item(clickable="", vripple="", @click("selected_component = 'bignumber'"), [itemsection(avatar=true, icon("filter_7")), itemsection("Big number")]),
                item(clickable="", vripple="", @click("selected_component = 'button'"), [itemsection(avatar=true, icon("smart_button")), itemsection("Button")]),
                item(clickable="", vripple="", @click("selected_component = 'checkbox'"), [itemsection(avatar=true, icon("check_box")), itemsection("Checkbox")]),
                item(clickable="", vripple="", @click("selected_component = 'chip'"), [itemsection(avatar=true, icon("crop_7_5")), itemsection("Chip")]),
                item(clickable="", vripple="", @click("selected_component = 'column'"), [itemsection(avatar=true, icon("view_column")), itemsection("Column")]),
                item(clickable="", vripple="", @click("selected_component = 'datefield'"), [itemsection(avatar=true, icon("calendar_today")), itemsection("Date field")]),
                item(clickable="", vripple="", @click("selected_component = 'date'"), [itemsection(avatar=true, icon("date_range")), itemsection("Date picker")]),
                item(clickable="", vripple="", @click("selected_component = 'drawer'"), [itemsection(avatar=true, icon("drawer")), itemsection("Drawer")]),
                item(clickable="", vripple="", @click("selected_component = 'expansion'"), [itemsection(avatar=true, icon("expand_more")), itemsection("Expansion")]),
                item(clickable="", vripple="", @click("selected_component = 'footer'"), [itemsection(avatar=true, icon("south")), itemsection("Footer")]),
                item(clickable="", vripple="", @click("selected_component = 'heading'"), [itemsection(avatar=true, icon("title")), itemsection("Heading")]),
                item(clickable="", vripple="", @click("selected_component = 'icon'"), [itemsection(avatar=true, icon("emoji_objects")), itemsection("Icon")]),
                item(clickable="", vripple="", @click("selected_component = 'img'"), [itemsection(avatar=true, icon("image")), itemsection("Image")]),
                item(clickable="", vripple="", @click("selected_component = 'inputs'"), [itemsection(avatar=true, icon("input")), itemsection("Input")]),
                item(clickable="", vripple="", @click("selected_component = 'knob'"), [itemsection(avatar=true, icon("trip_origin")), itemsection("Knob")]),
                item(clickable="", vripple="", @click("selected_component = 'list'"), [itemsection(avatar=true, icon("list")), itemsection("List")]),
                item(clickable="", vripple="", @click("selected_component = 'radio'"), [itemsection(avatar=true, icon("radio_button_checked")), itemsection("Radio")]),
                item(clickable="", vripple="", @click("selected_component = 'range'"), [itemsection(avatar=true, icon("tune")), itemsection("Range")]),
                item(clickable="", vripple="", @click("selected_component = 'rating'"), [itemsection(avatar=true, icon("star_rate")), itemsection("Rating")]),
                item(clickable="", vripple="", @click("selected_component = 'row'"), [itemsection(avatar=true, icon("view_headline")), itemsection("Row")]),
                item(clickable="", vripple="", @click("selected_component = 'scrollarea'"), [itemsection(avatar=true, icon("square")), itemsection("Scroll area")]),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'select'", [itemsection(avatar=true, icon("unfold_more")), itemsection("Select")]),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'separator'", [itemsection(avatar=true, icon("maximize")), itemsection("Separator")]),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'sliders'", [itemsection(avatar=true, icon("tune")), itemsection("Slider")]),
                item(clickable="", vripple="", @click("selected_component = 'spinner'"), [itemsection(avatar=true, icon("change_circle")), itemsection("Spinner")]),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'tab'", [itemsection(avatar=true, icon("tab")), itemsection("Tabs")]),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'table'", [itemsection(avatar=true, icon("table_view")), itemsection("Table")]),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'timefield'", [itemsection(avatar=true, icon("timer_10_select")), itemsection("Time Field")]),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'timepicker'", [itemsection(avatar=true, icon("schedule")), itemsection("Time Picker")]),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'timeline'", [itemsection(avatar=true, icon("timeline")), itemsection("Timeline")]),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'toggles'", [itemsection(avatar=true, icon("toggle_on")), itemsection("Toggle")]),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'toolbar'", [itemsection(avatar=true, icon("view_week")), itemsection("Toolbar")]),
                item(clickable="", vripple="", var"v-on:click"="selected_component = 'tooltip'", [itemsection(avatar=true, icon("textsms")), itemsection("Tooltip")]),
                item(clickable="", vripple="", @click("selected_component = 'uploader'"), [itemsection(avatar=true, icon("upload_file")), itemsection("Uploader")]),
                item(clickable="", vripple="", @click("selected_component = 'video'"), [itemsection(avatar=true, icon("videocam")), itemsection("Video")]),
            ])
        ),
        page_container(
            [
            Html.div(class="", @iif("selected_component == 'badge'"), [
                form_card(BadgeC, "Badge"),
                docs_card(@doc badge)
            ]),
            Html.div(class="", @iif("selected_component == 'bignumber'"), [
                form_card(BigNumber, "Big number"),
                docs_card(@doc bignumber)
            ]),
            Html.div(class="", @iif("selected_component == 'button'"), [
                form_card(Button, "Button"),
                form_card(ButtonIcon, "Button with icon"),
                form_card(ButtonTooltip, "Button with tooltip"),
                form_card(ButtonProgress, "Button progress indicator"),
                #= docs_card(@doc btn) =#
            ]),
            Html.div(class="", @iif("selected_component == 'checkbox'"), [
                form_card(Checkbox, "Checkbox"),
                form_card(CheckboxMultiple, "Multiple checkboxes"),
                docs_card(@doc checkbox)
            ]),
            Html.div(class="", @iif("selected_component == 'chip'"), [
                form_card(Chip, "Chip"),
                form_card(ChipClick, "Clickable chip"),
                docs_card(@doc chip)
            ]),
            Html.div(class="", @iif("selected_component == 'column'"), [
                form_card(ColumnC, "Column"),
                #= docs_card(@doc checkbox) =#
            ]),
            Html.div(class="", @iif("selected_component == 'datefield'"), [
                form_card(Datefield, "Date field"),
                docs_card(@doc datefield)
            ]),
            Html.div(class="", @iif("selected_component == 'date'"), [
                form_card(DatePickerC, "Date picker"),
                form_card(DateMultiple, "Multiple date picks"),
                form_card(DateRangeC, "Range date picker"),
                docs_card(@doc datepicker)
            ]),
            Html.div(class="", @iif("selected_component == 'drawer'"), [
                form_card(Drawer, "Drawer"),
                docs_card(@doc drawer)
            ]),
            Html.div(class="", @iif("selected_component == 'expansion'"), [
                form_card(Expansion, "Expansion"),
                docs_card(@doc expansionitem)
            ]),
            Html.div(class="", @iif("selected_component == 'footer'"), [
                form_card(Footer, "Footer"),
            ]),
            Html.div(class="", @iif("selected_component == 'heading'"), [
                form_card(Heading, "Heading"),
            ]),
            Html.div(class="", @iif("selected_component == 'icon'"), [
                form_card(Icon, "Icon"),
                docs_card(@doc icon)
            ]),
            Html.div(class="", @iif("selected_component == 'inputs'"), [
                form_card(TextInput, "Text input"),
                #= form_card(TextInputPassword, "Text input password"), =#
                form_card(TextInputMask, "Text input mask"),
                form_card(TextInputValidation, "Text input validation"),
                docs_card(@doc textfield)
            ]),
            Html.div(class="", @iif("selected_component == 'img'"), [
                form_card(Img, "Image"),
                #= form_card(TextInputPassword, "Text input password"), =#
                form_card(ImgCaption, "Image with caption"),
                docs_card(@doc imageview)
            ]),
            Html.div(class="", @iif("selected_component == 'knob'"), [
                form_card(Knob, "Knob"),
                docs_card(@doc knob)
            ]),
            Html.div(class="", @iif("selected_component == 'list'"), [
                form_card(List, "List"),
                form_card(ListComplex, "Complex list"),
                docs_card(@doc list)
            ]),
            Html.div(class="", @iif("selected_component == 'radio'"), [
                form_card(Radio, "Radio"),
                form_card(RadioColor, "Colored radio"),
                docs_card(@doc radio)
            ]),
            Html.div(class="", @iif("selected_component == 'range'"), [
                form_card(Range, "Range"),
                form_card(RangeMarkers, "Range with markers"),
                docs_card(@doc range)
            ]),
            Html.div(class="", @iif("selected_component == 'rating'"), [
                form_card(Rating, "Rating"),
                docs_card(@doc rating)
            ]),
            Html.div(class="", @iif("selected_component == 'row'"), [
                form_card(Row, "Row"),
                #= docs_card(@doc row) =#
            ]),
            Html.div(class="", @iif("selected_component == 'scrollarea'"), [
                form_card(ScrollArea, "Scroll area"),
                docs_card(@doc scrollarea)
            ]),
            Html.div(class="", @iif("selected_component == 'select'"), [
                form_card(Select, "Select"),
                form_card(SelectClearable, "Clearable select with input"),
                form_card(SelectMultiple, "Multiple choices with chips"),
                docs_card(@doc select)
            ]),
            Html.div(class="", @iif("selected_component == 'separator'"), [
                form_card(Separator, "Separator"),
                docs_card(@doc separator)
            ]),
            Html.div(class="", @iif("selected_component == 'sliders'"), [
                form_card(Slider, "Slider"),
                form_card(SliderIcon, "Slider with an icon"),
                docs_card(@doc slider)
            ]),
            Html.div(class="", @iif("selected_component == 'spinner'"), [
                form_card(Spinner, "Spinner"),
                docs_card(@doc spinner)
            ]),
            Html.div(class="", @iif("selected_component == 'tab'"), [
                form_card(Tab, "Tabs"),
                docs_card(@doc tabgroup)
            ]),
            Html.div(class="", @iif("selected_component == 'table'"), [
                form_card(Table, "Table"),
                form_card(TablePagination, "Table pagination"),
                form_card(TableSearch, "Table with search"),
                form_card(TableGrid, "Table grid layout"),
                docs_card(@doc table)
            ]),
            #= Html.div(class="", @iif("selected_component == 'timefield'"), [ =#
            #=     form_card(Timefield, "Time field"), =#
            #=     docs_card(@doc timefield) =#
            #= ]), =#
            Html.div(class="", @iif("selected_component == 'timepicker'"), [
                form_card(Timepicker, "Time picker"),
                docs_card(@doc timepicker)
            ]),
            Html.div(class="", @iif("selected_component == 'timeline'"), [
                form_card(Timeline, "Timeline"),
                docs_card(@doc timeline)
            ]),
            Html.div(class="", @iif("selected_component == 'toggles'"), [
                form_card(Toggle, "Toggle"),
                form_card(ToggleValue, "Toggle with custom true/false value"),
                form_card(ToggleMultiple, "Multiple toggles"),
                docs_card(@doc toggle)
            ]),
            Html.div(class="", @iif("selected_component == 'toolbar'"), [
                form_card(Toolbar, "Toolbar"),
                docs_card(@doc toolbar)
            ]),
            Html.div(class="", @iif("selected_component == 'tooltip'"), [
                form_card(Tooltip, "Tooltip"),
                docs_card(@doc tooltip)
            ]),
            Html.div(class="", @iif("selected_component == 'uploader'"), [
                form_card(Uploader, "Uploader")
                #= docs_card(@doc uploader) =#
            ]),
            Html.div(class="", @iif("selected_component == 'video'"), [
                form_card(Video, "Video"),
                docs_card(@doc video)
            ]),
        ]),
        footer(br())
    ],
    view="hHh lpR fFf",
    class="window-height",
)



