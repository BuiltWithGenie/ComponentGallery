TextInputMask = Component(
    :(@in phone = ""),
    :(),
    quote
        let
            textfield("Phone", :phone, filled="", mask="(###) ### - ####", hint="Mask: (###) ### - ####",)
        end
    end,
    "TextMask_"
)
