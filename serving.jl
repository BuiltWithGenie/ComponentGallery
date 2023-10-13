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
