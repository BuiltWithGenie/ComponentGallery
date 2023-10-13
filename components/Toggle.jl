Toggle = Component(
    :(@in value = "true"),
    :(),
    quote
        let
            toggle("Toggle", :value, color="blue")
        end
    end,
    "Toggle_"
)
