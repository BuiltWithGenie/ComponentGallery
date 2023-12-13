Spinner = Component(
    :(@out count=0; @in start=false),
    :(
      @onbutton start begin
          while count <=10
              @show count
            count += 1
            sleep(0.5)
        end
          count = 0
      end
     ),
    quote
        [spinner("hourglass",color="primary", size="20px", @iif("$(prefix)count <10")), p("{{$(prefix)count}}"),btn("Start timer", @click(:start),loading=:start)]
    end,
    "spinner_"
)
