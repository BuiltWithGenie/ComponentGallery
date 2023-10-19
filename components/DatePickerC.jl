DatePickerC = Component(
    :(@in date = today()),
    :(),
    quote
        datepicker(:date)
    end,
    "DatePicker_"
)
