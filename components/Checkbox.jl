Checkbox = Component(
    :(@in checked = true),
    :(),
    quote
        let
            checkbox("Checked", :checked)
        end
    end,
    "Checkbox_"
)
