using .Components

FilePicker = Component(
    :(@in files = [""]),
    :(@onchange files begin
        println(files)
    end),
    quote
        cell([quasar(:file, fieldname=:files, label="Pick files", filled="", counter="", multiple="multiple", style="max-width: 301px",)])
    end,
    "Files_"
)
