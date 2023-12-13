Expansion = Component(
    :(),
    :(),
    quote
        [
      expansionitem(label="Click here", dense=true, var"dense-toggle"=true, var"expand-separator"=true, var"header-class"="bg-blue-1",
                    p("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor."),
        )
   ]
    end,
    "expansion_"
)
