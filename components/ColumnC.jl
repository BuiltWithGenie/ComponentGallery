ColumnC = Component(
    :(),
    :(),
    quote
        [
            row([
                column(span("Hello"), size=2, class="bg-blue-2"),
                column(span("Genie"), size=4, class="bg-red-2")
            ])
        ]
    end,
    "Column_"
)
