ButtonProgress = Component(
    :(@in process = false; @in progress = 0.0),
    quote
        @onbutton process begin
            for progress in 0:0.1:1
                @show progress
                sleep(0.5)
            end
            progress = 0.0
        end
    end,
    quote
        [
            btn("Process", @click(:process), loading=:process, color="primary", class="q-mr-sm"),
            btn("Process", @click(:process), loading=:process, percentage=:progress, color="green"),
        ]
    end,
    "ButtonProgress_"
)
