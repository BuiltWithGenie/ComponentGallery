SelectMultiple = Component(
    :(@in fruit = ["orange"]; @out fruit_list = ["orange", "melon", "watermelon"]),
    :(),
    quote
        select(:fruit, options=:fruit_list, label="Fruits", clearable="", multiple=true, usechips=true)
    end,
    "SelectMultiple_"
)
