Toggle = Component(
    :(@in value = true),
    :(),
    quote
        let
            toggle(:value, color="blue")
        end
    end,
    "Toggle_"
)
