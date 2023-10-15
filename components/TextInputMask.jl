TextInputMask = Component(
    :(@in phone = ""),
    :(),
    quote
        textfield("Phone", :phone, filled="", mask="(###) ### - ####", hint="Mask: (###) ### - ####",)
    end,
    "TextMask_"
)
