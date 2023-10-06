Slider = Component(
    :(@in volume = 4),
    :(),
    quote
        let
            slider(1:1:10, :volume)
        end
    end,
    "Slider_"
)
