using .Components

FilePicker = Component(
    :(@in files = [""]),
    :(@onchange files begin
        println(files)
    end),
    quote
        let
            cell([quasar(:file, fieldname=:files, label="Pick files", filled="", counter="", multiple="multiple", style="max-width: 301px",)])
        end
    end,
    "Files_"
)
