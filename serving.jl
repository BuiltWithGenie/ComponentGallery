include("Components.jl")
using .Components

function serve(c::Component)
    @page("/test", c())
end

function serve_components()
    for file in readdir("components/")
        include("components/$file")
        cname = Symbol(split(file, ".")[1])
        @show cname
        ui = eval(:($cname()))
        @page("/$cname", ui)
    end
end

function export_components(list::Vector{Symbol}; name_map::Dict=Dict())
    if !isdir("export")
        mkdir("export")
    end
    cname = ""
    for csymbol in list
        try
            cname = string(csymbol)
            include("components/$cname.jl")
            c = eval(csymbol)
            reactive_code = ""
            if !is_empty(c.variables) || !is_empty(c.handlers)
                reactive_code = join(["@app begin\n", get_code(c, :variables) * "\n", get_code(c, :handlers) * " ", "end\n"])
            end
            ui_code = "ui() = " * replace(get_code(c, :ui), "$(c.prefix)" => "") |> format_text
            reactive_code = replace(reactive_code, "$(c.prefix)" => "") * "\n" |> format_text
            # rename output file if name map is passed
            if haskey(name_map, cname)
                cname = name_map[cname]
            end
            open("export/$cname.jl", "w") do f
                print(f, reactive_code)
                print(f, ui_code)
            end
        catch e
            println("Could not export $cname\n $e")
        end
    end

end

#name_map = Dict("Button" => "btn", "DatePickerC" => "datepicker", "TextInput" = "input")
function export_components(; name_map::Dict=Dict())
    files = readdir("components")
    components = [Symbol(split(f, ".")[1]) for f in files]
    export_components(components; name_map)
end

