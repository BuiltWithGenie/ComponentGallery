ListComplex = Component(
    :(@in check = "false"),
    :(),
    quote
        list(bordered=true, separator=true, padding=true, style="width:400px", [
            toolbar("Configuration", class="bg-primary text-white shadow-2"),
            item(clickable="", vripple="",
                item_section([
                    item_label("Content filtering"),
                    item_label(caption=true, "Set the content filtering level to restrict apps that can be downloaded")
                ])
            ),
            item(clickable="", vripple="",
                item_section([
                    item_label("Password"),
                    item_label(caption=true, "Require password for purchase or use password to restrict purchase")
                ])
            ),
            separator(spaced=true),
            item_label(header=true, "Other"),
            separator(spaced=true),
            item(
                var"v-ripple"=true,
                [
                    item_section(checkbox("", :check)),
                    item_section([
                        item_label("Auto-add widgets"),
                        item_label(caption=true, "Automatically add home screen widgets")
                    ])
                ]
            ),
            item(
                var"v-ripple"=true,
                [
                    item_section(side=true, top=true, checkbox("", :check)),
                    item_section([
                        item_label("Auto-add widgets"),
                        item_label(caption=true, "Automatically add home screen widgets")
                    ])
                ]
            ),
        ])
        #= <q-item tag="label" v-ripple> =#
        #=   <q-item-section side top> =#
        #=     <q-checkbox v-model="check3" /> =#
        #=   </q-item-section> =#
        #==#
        #=   <q-item-section> =#
        #=     <q-item-label>Auto-add widgets</q-item-label> =#
        #=     <q-item-label caption> =#
        #=       Automatically add home screen widgets =#
        #=     </q-item-label> =#
        #=   </q-item-section> =#
        #= </q-item> =#
    end,
    "ListComplex_"
)
