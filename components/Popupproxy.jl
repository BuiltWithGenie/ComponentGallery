Popupproxy = Component(
    :(),
    :(),
    quote
btn("Handles click", push=true, color="primary", [
          popupproxy([
            banner("You have lost connection to the internet. This app is offline.", [
              template("", "v-slot:avatar", [
                icon("signal_wifi_off", color="Primary")
              ])
            ])
          ])
       ])
    end,
    "popupproxy_"
)
