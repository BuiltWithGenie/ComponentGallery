List = Component(
    :(@out fruits = ["orange", "melon", "watermelon"]),
    :(),
    quote
        list(bordered=true, separator=true, @recur("fruit in $(prefix)fruits"), item(clickable=true, item_section("{{fruit}}")))
    end,
    "List_"
)
