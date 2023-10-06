TextInputValidation = Component(
    :(@in text = ""),
    :(),
    quote
        let
            textfield("Required Field", :text, ref="inputRef", filled="", var":rules"="[ val => val.length <= 3 || 'Please use maximum 3 characters']")
        end
    end,
    "TextValidation_"
)
