CheckboxMultiple = Component(
    :(@in checked = true, @in selection = []),
    :(),
    quote
        [
            checkbox("Orange", :selection, val="orange", color="orange"),
            checkbox("Melon", :selection, val="melon", color="green"),
            checkbox("Watermelon", :selection, val="watermelon", color="red")
        ]
    end,
    "CheckboxMultiple_"
)
