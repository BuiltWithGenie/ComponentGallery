Toggle = Component(
    :(@in value = "true"),
    :(),
    quote
        toggle("Toggle", :value, color="blue")
    end,
    "Toggle_"
)
