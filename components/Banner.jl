const Banner = Component(
    :(),
    :(),
    quote
banner("Unfortunately, the credit card did not go through, please try again.", class="bg-primary text-white", [
          template("", "v-slot:action", [
            btn("Dismiss", flat=true, color="white"),
            btn("Update Credit Card", flat=true, color="white")
          ])
       ])
    end,
    "banner_"
)
