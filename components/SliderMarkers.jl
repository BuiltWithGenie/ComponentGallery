SliderMarkers = Component(
    :(@in volume = 4; @in marker = 4),
    :(@onchange volume begin
        println(volume)
    end),
    quote
        let
            slider(2:1:10, :volume, class="q-mt-xl", color="deep-orange", labelalways="", markers="", markerlabels="", min=R"1", max=R"10", var"inner-min"=R"2", var"inner-max"=R"8",
                template(var"v-slot:marker-label-group"="scope",
                    Stipple.Html.div(
                        var"v-for"="marker in scope.markerList",
                        (key!)="marker.index",
                        (style!)="marker.style",
                        var"v-on:click"="volume = marker.value",
                        "{{marker}}"
                    )
                )
            )
        end
    end,
    "SliderMarkers_"
)
