SelectClearable = Component(
    :(@in fruit = ["orange"]; @out fruit_list = ["orange", "melon", "watermelon"]),
    :(),
    quote
        select(:fruit, options=:fruit_list, label="Fruits", clearable=true, useinput=true)
    end,
    "SelectClearable_"
)
