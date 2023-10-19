Button = Component(
    :(@in process = false; @in count = 0),
    quote
        @onbutton process begin
            count += 1
        end
    end,
    quote
        [
            p("Click count: {{$(prefix)count}}"),
            btn("Process", @click(:process)),
            btn("Increase count", @click("$(prefix)count = $(prefix)count+1"))
        ]
    end,
    "Button_"
)
