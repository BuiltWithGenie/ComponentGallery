Tab = Component(
    :(@in selected = "photos"),
    :(),
    quote
        [
    tabgroup(:selected, inlinelabel=true, class="bg-primary text-white shadow-2", [
          tab(name="photos", icon="photos", label="Photos",),
          tab(name="videos", icon="slow_motion_video", label="Videos"),
          tab(name="movies", icon="movie", label="Movies")
       ]),
    tabpanels(:selected, animated=true, var"transition-prev"="scale", var"transition-next"="scale",[
          tabpanel(name="photos", [
             p("Photos content")
          ]),
          tabpanel(name="videos", [
             p("Videos content")
          ]),
          tabpanel(name="movies", [
             p("Movies content")
            ])
                  ])
   ]
    end,
    "tab_"
)
