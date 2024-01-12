Timefield = Component(
    :(@in start_time = Dates.Time(now())),
    :(),
    quote
timefield("Start time", :start_time, timepicker_props = Dict(:nowbtn => true, :nounset => true, :format24h => true, :withseconds => true), textfield_props = Dict(:bgcolor => "blue-1"))
    end,
    "Timefield_"
)
