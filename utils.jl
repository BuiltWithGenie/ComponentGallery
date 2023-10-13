function extractLetBlock(code::String)
    # Split the code into lines
    lines = split(code, '\n')

    # Flags to indicate if we are inside a let block and should record lines
    inLetBlock = false

    # Array to hold the lines of code inside the let block
    letBlockLines = String[]

    for line in lines
        stripped = strip(line)  # Remove leading and trailing whitespaces

        # Check if the line contains the let keyword
        if occursin("let", stripped)
            inLetBlock = true
            continue  # Skip the line with the let keyword
        end

        # Check if the line contains the end keyword and we are in a let block
        if inLetBlock && occursin("end", stripped)
            inLetBlock = false
            break  # Exit the loop after the end keyword
        end

        # Record the line if we are inside a let block and it's not a comment
        if inLetBlock && !startswith(stripped, "#=")
            push!(letBlockLines, stripped)
        end
    end

    # Join the recorded lines into a single string
    return join(letBlockLines, '\n')
end

