DateMultiple = Component(
    :(@in dates = [today() + Day(2), today() + Day(4)]),
    :(),
    quote
        datepicker(:dates, multiple=true)
    end,
    "DateMultiple_"
)
