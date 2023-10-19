ScrollArea = Component(
    :(),
    :(),
    quote
        scrollarea(style="height: 200px; max-width: 300px;",
            Html.div("Stipple is a reactive UI library for building interactive
            data applications in pure Julia. It uses Genie.jl (on the server side)
            and Vue.js (on the client). Stipple uses a high performance MVVM
            architecture, which automatically synchronizes the state two-way
            (server -> client and client -> server) sending only JSON data over
            the wire. The Stipple package provides the fundamental communication
            layer, extending Genie's HTML API with a reactive component.")
        )
    end,
    "ScrollArea_"
)
