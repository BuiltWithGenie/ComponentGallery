RadioColor = Component(
    :(@in shape = "line"),
    :(),
    quote
        Stipple.Html.div(class="q-pa-md", [
            Stipple.Html.div(class="q-gutter-sm", [
                radio("Line", :shape, val="line", color="teal"),
                radio("Rectangle", :shape, val="rectangle", color="orange"),
                radio("Ellipse", :shape, val="ellipse", color="red"),
                radio("Polygon", :shape, val="polygon", color="blue")
            ]),
            Stipple.Html.div(class="q-px-sm", [
                "Your selection is: ",
                strong(
                    "{{$(prefix)shape }}"
                )
            ])
        ])
    end,
    "RadioColor_"
)
