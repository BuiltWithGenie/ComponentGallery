SliderIcon = Component(
    :(@in volume = 4),
    :(),
    quote
        item([
            itemsection(avatar="",
                icon("volume_up", color="teal",)
            ),
            itemsection(
                slider(0:1:10, :volume, label="", color="teal",)
            )
        ])
    end,
    "SliderIcon_"
)
