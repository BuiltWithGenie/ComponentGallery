TextInput = Component(
    :(@in text = ""),
    :(@onchange text begin
        println(text)
    end),
    quote
        let
            textfield("Label", :text, bottomslots="", counter="", maxlength="12", dense="", [
                template(var"v-slot:append"="", [
                    icon("close", @iif("$(prefix)text !== ''"), @click("$(prefix)text = ''"), class="cursor-pointer",),
                ]),
            ]
            )
        end
    end,
    "Text_"
)
