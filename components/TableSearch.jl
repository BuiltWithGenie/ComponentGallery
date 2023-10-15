TableSearch = Component(
    quote
        @out data = DataTable(DataFrame(
            name=["Frozen Yogurt", "Ice cream sandwich", "Eclair", "Cupcake", "Gingerbread", "Jelly bean", "Lollipop", "Honeycomb", "Donut", "KitKat"],
            calories=[159, 237, 262, 305, 356, 375, 392, 408, 452, 518],
            fat=[6.0, 9.0, 16.0, 3.7, 16.0, 0.0, 0.2, 3.2, 25.0, 26.0],
            carbs=[24, 37, 23, 67, 49, 94, 98, 87, 51, 65]
        ))
        @in dfilter = ""
    end,
    :(),
    quote
        table(:data, flat=true, bordered=true, title="Treats", var"row-key"="name", filter=:dfilter, hideheader="",
            template(var"v-slot:top-right"="",
                textfield("", :dfilter, dense=true, debounce="300", placeholder="Search", [
                    template(var"v-slot:append"=true,
                        icon("search")
                    )
                ]
                )
            )
        )
    end,
    "TableSearch_"
)

