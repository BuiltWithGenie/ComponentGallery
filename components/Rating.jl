Rating = Component(
    :(@in value=5),
    :(),
    quote
        rating(:value)
        rating(:value, icon="thumb_up")
    end,
    "rating_"
)
