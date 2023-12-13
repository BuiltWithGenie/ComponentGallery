Knob = Component(
    :(@in value=5),
    :(),
    quote
        knob(1:1:10, :value, color="primary")
    end,
    "knob_"
)
