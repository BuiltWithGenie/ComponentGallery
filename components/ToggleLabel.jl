ToggleLabel = Component(
    :(@in value = "true"),
    :(),
    quote
        let
            toggle("Toggle", :value, color="blue")
        end
    end,
    "ToggleLabel_"
)
