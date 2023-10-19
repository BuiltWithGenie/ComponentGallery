RangeMarkers = Component(
    :(@in r = RangeData(0:30); @out labels = [Dict(:value => i, :label => string(i) * "%") for i in 0:5:30]),
    :(),
    quote
        [range(1:1:30, :r, markers=true, label=true),
            range(1:1:30, :r, var"marker-labels"=true, color="orange"),
            range(0:5:30, :r, markers=true, var":marker-labels"="$(prefix)labels", color="secondary")]

    end,
    "Range_Markers_"
)
