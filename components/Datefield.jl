Datefield = Component(
    :(@in start_date = today()),
    :(),
    quote
datefield("Start date", :start_date, datepicker_props = Dict(:todaybtn => true, :nounset => true), textfield_props = Dict(:bgcolor => "green-1"))
    end,
    "Datefield_"
)
