Tooltip = Component(
    :(),
    :(),
    quote
        [
        icon("warning", size="25px",[tooltip("Fire!")]),
        btn("Hover me", color="primary", [tooltip("Additional info")])
]
    end,
    "tooltip_"
)
