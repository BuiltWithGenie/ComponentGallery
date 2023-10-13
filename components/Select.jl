Select = Component(
    :(@in fruit = ["orange"]; @out fruit_list = ["orange", "melon", "watermelon"]),
    :(),
    quote
        let
            select(:fruit, options=:fruit_list, label="Fruits")
            #= """ <q-select v-model="fruit" label="Fruits" :options="options"></q-select> """ =#
        end
    end,
    "Select_"
)
