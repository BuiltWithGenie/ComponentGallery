Range = Component(
    :(@in r = RangeData(1:5)),
    :(),
    quote
        [range(1:1:30, :r, label=true),
            range(1:1:30, :r, vertical=true, labelalways=true)]

    end,
    "Range_"
)
