Radio = Component(
    :(@in shape = "line"),
    :(),
    quote
        let
            Stipple.Html.div(class="q-pa-md", [
                Stipple.Html.div(class="q-gutter-sm", [
                    radio("Line", :shape, val="line",),
                    radio("Rectangle", :shape, val="rectangle",),
                    radio("Ellipse", :shape, val="ellipse",),
                    radio("Polygon", :shape, val="polygon",)
                ]),
                Stipple.Html.div(class="q-px-sm", [
                    "Your selection is: ",
                    strong(
                        "{{$(prefix)shape }}"
                    )
                ])
            ])
        end
    end,
    "Radio_"
)
