ChipClick = Component(
    :(@in clicked = false; @out clicks=0),
    :(
@onbutton clicked begin
    clicks += 1
end
     ),
    quote
        [chip("Add event to calendar", icon="event", clickable = true, @click(:clicked)), p("Clicks: {{$(prefix)clicks}}")]
    end,
    "chipClick_"
)
