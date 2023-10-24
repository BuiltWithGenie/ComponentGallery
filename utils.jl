using JuliaFormatter

function clean_code(code::String)
    # Use a regular expression to remove all occurrences of comments between #= and =#
    cleaned_code = replace(code, r"#=.*?=#"s => "")
    cleaned_code = join(filter(line -> !isempty(strip(line)), split(cleaned_code, '\n')), '\n')
    return String(strip(cleaned_code))  # Remove leading and trailing whitespaces and return the cleaned code
end

# extract code from expressions :() and quotes
function extract_code(code::String)
    extracted_code = clean_code(code)
    if startswith(extracted_code, "begin")
        lines = strip.(filter(line -> !isempty(strip(line)), split(extracted_code, '\n')))
        extracted_code = join(lines[2:end-1], "\n")
    end
    return extracted_code
end
function extract_let_block(code::String)
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


is_empty(expr::Expr) = string(expr) == "()"

