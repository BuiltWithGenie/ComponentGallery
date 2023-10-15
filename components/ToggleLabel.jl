ToggleLabel = Component(
    :(@in value = "true"),
    :(),
    quote
        toggle("Toggle", :value, color="blue")
    end,
    "ToggleLabel_"
)
