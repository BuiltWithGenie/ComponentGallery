ButtonIcon = Component(
    :(),
    :(),
    quote
        [
            btn("Mail", icon="mail", color="primary", class="q-mr-sm"),
            # use var"icon-right" since Julia does not allow dashes in parameters
            btn("Send", var"icon-right"="send", color="secondary", class="q-mr-sm"),
            btn("Send", icon="mail", var"icon-right"="send", color="orange")
        ]
    end,
    "ButtonIcon_"
)
