ToggleLabel = Component(
    :(@in value = true),
    :(),
    quote
        let
            toggle(:value, color="blue", label="Click me!")
        end
    end,
    "ToggleLabel_"
)
