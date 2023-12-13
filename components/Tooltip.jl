Timepicker = Component(
    :(@in time = Dates.Time(20,23,05)),
    :(),
    quote
        [
         timepicker(:time, mask="HH:mm"),
         timepicker(:time, mask="HH:mm:ss"),
]
    end,
    "timepicker_"
)
