module Components
using GenieFramework
export Component, variables, handlers, ui

struct Component
    variables::Expr
    handlers::Expr
    ui::Expr
    prefix::String

function Component(vars::Expr, handlers::Expr, ui::Expr, prefix::String)
    var_list = extract_var_names(vars)
    prefixed_vars = add_prefix!(vars, prefix, var_list)
    prefixed_handlers = add_prefix!(handlers, prefix, var_list)
    prefixed_ui = add_prefix!(ui, prefix, var_list)
    return new(prefixed_vars, prefixed_handlers, prefixed_ui, prefix)
end
end

variables(c::Component, M::Module=@__MODULE__) = Base.eval(M, c.variables)
handlers(c::Component, M::Module=@__MODULE__) = Base.eval(M, c.handlers)
ui(c::Component, M::Module=@__MODULE__) = Base.eval(M, c.ui)

function extract_var_names(expr::Expr)
    var_names = Symbol[]
    if expr.head == :block || expr.head == :macrocall
        for arg in expr.args
            if isa(arg, Expr) && arg.head == :(=) && isa(arg.args[1], Symbol)
                push!(var_names, arg.args[1])
            elseif isa(arg, Expr)
                append!(var_names, extract_var_names(arg))
            end
        end
    end
    return var_names
end

function add_prefix!(expr::Expr, prefix::String, vars::Vector{Symbol})
    if isa(expr, Expr)
        for i in eachindex(expr.args)
            if isa(expr.args[i], Expr)
                add_prefix!(expr.args[i], prefix, vars)
            elseif isa(expr.args[i], QuoteNode) && expr.args[i].value in vars
                expr.args[i] = QuoteNode(Symbol(prefix, string(expr.args[i].value)))
            elseif isa(expr.args[i], Symbol) && expr.args[i] in vars
                expr.args[i] = Symbol(prefix, string(expr.args[i]))
            elseif expr.args[i] == :prefix
                    expr.args[i] = prefix
            end
        end
    end
    return expr
end

end
