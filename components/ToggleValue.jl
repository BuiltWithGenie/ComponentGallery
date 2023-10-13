# This one does not work because the toggle function takes the label as first arg. For it to work, the label needs to be null

ToggleValue = Component(
    :(@in value = "true"),
    :(),
    quote
        let
            toggle("Click me!", :value, color="blue", var"true-value"="On", var"false-value"="Off")
        end
    end,
    "ToggleValue_"
)
