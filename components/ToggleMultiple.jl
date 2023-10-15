ToggleMultiple = Component(
    quote
        @out toggle_list = ["red", "green", "yellow"]
        @out toggle_states = ["true", "false", "true"]
    end,
    :(),
    quote
        Html.div(@recur("toggle in $(prefix)toggle_list"),
            toggle(:toggle, :toggle_states, val=:toggle, color=:toggle)
        )
    end,
    "ToggleMultiple_"
)
