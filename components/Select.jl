Select = Component(
    :(@in fruit = ["orange"]; @out fruit_list = ["orange", "melon", "watermelon"]),
    :(),
    quote
        select(:fruit, options=:fruit_list, label="Fruits")
    end,
    "Select_"
)
