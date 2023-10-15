TextInputPassword = Component(
    :(@in isPwd = true; @in password = "pass"),
    :(),
    quote
        textfield("", :password, filled="", var":type"="$(prefix)isPwd ? 'password' : 'text'", hint="Password with toggle", [
            template(var"v-slot:append"="", [
                icon("$(prefix)isPwd ? 'visibility_off' : 'visibility'", class="cursor-pointer", var"v-on:click"="$(prefix)isPwd = !$(prefix)isPwd",)
            ])
        ])
    end,
    "TextPassword_"
)
