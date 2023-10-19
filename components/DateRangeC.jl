DateRangeC = Component(
    :(@in daterange = DateRange(today(), (today() + Day(3)))),
    :(),
    quote
        datepicker(:daterange, range=true)
    end,
    "DateRange_"
)
