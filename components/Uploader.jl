Uploader = Component(
    quote
        @out acceptext = ".jpg, .jpeg, .pdf, image/*"
        @out imgsrc = "https://placehold.co/600x400"
        @out maxsize = 1 * 1024 * 1024
        @out caption = "No image selected"
    end,
    quote

  @onchange fileuploads begin
    if ! isempty(fileuploads)
      @info "File was uploaded: " fileuploads
      filename = Random.randstring(10) * "_" * base64encode(fileuploads["name"])

      try
        isdir(joinpath("public", "uploads")) || mkpath(joinpath("public", "uploads"))
        mv(fileuploads["path"], joinpath("public", "uploads", filename))
      catch e
        @error "Error processing file: $e"
        notify(__model__,"Error processing file: $(fileuploads["name"])")
      end

      imgsrc = "/uploads/$filename"
      fileuploads = Dict{AbstractString,AbstractString}()
      @show imgsrc
    end
  end
 @event rejected begin
    @info "rejected"
    # __model__ is the page's reactive model. https://learn.genieframework.com/docs/reference/reactive-ui/reactivity#under-the-hood-reactive-models
    notify(__model__,"File rejected. Please make sure it is a valid image file.")
  end

   @event added begin
     @info "added"
   end

   @event removed begin
     @info "removed"
   end

   @event started begin
     @info "started"
   end

   @event uploading begin
     @info "uploading"
   end

  @event uploaded begin
    @info "uploaded"
  end

  @event finished begin
    @info "finished"
    notify(__model__,"Upload finished.")
  end

  @event failed begin
    @info "failed"
  end

    end,
    quote
         uploader( multiple = true,
              accept = :acceptext,
              maxfilesize = :maxsize,
              maxfiles = 10,
              autoupload = true,
              hideuploadbtn = true,
              label = "Upload Images",
              nothumbnails = true,
              style="max-width: 95%; width: 95%; margin: 0 auto;",

              @on("rejected", :rejected),
              @on("uploaded", :uploaded),
              @on("finish", :finished),
              @on("failed", :failed),
              @on("uploading", :uploading),
              @on("start", :started),
              @on("added", :added),
              @on("removed", :removed),
            )
    end,
    "upl_"
)
