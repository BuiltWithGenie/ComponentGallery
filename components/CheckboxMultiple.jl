CheckboxMultiple = Component(
    :(@in checked = true, @in selection = []),
    :(),
    quote
        let
            [
                checkbox("Orange", :selection, val="orange", color="orange"),
                checkbox("Melon", :selection, val="melon", color="green"),
                checkbox("Watermelon", :selection, val="watermelon", color="red")
            ]
        end
    end,
    "CheckboxMultiple_"
)
