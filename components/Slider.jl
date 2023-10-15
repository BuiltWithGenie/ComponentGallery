Slider = Component(
    :(@in volume = 4),
    :(),
    quote
        slider(1:1:10, :volume)
    end,
    "Slider_"
)
