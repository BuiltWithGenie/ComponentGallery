Checkbox = Component(
    :(@in checked = true),
    :(),
    quote
        checkbox("Checked", :checked)
    end,
    "Checkbox_"
)
