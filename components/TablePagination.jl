TablePagination = Component(
    quote
        @out data = DataTable(DataFrame(
            name=["Frozen Yogurt", "Ice cream sandwich", "Eclair", "Cupcake", "Gingerbread", "Jelly bean", "Lollipop", "Honeycomb", "Donut", "KitKat"],
            calories=[159, 237, 262, 305, 356, 375, 392, 408, 452, 518],
            fat=[6.0, 9.0, 16.0, 3.7, 16.0, 0.0, 0.2, 3.2, 25.0, 26.0],
            carbs=[24, 37, 23, 67, 49, 94, 98, 87, 51, 65]
        ))
        @in tpagination = DataTablePagination(rows_per_page=3)
    end,
    :(),
    quote
        table(:data, pagination=:tpagination, flat=true, bordered=true, title="Treats")
    end,
    "TablePagination_"
)

