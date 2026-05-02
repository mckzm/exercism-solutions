function transform(ch)
    if ch == '-'
        return "_"
    elseif isspace(ch) || isdigit(ch)
        return ""
    elseif isuppercase(ch)
        return "-" * lowercase(ch)
    elseif ch in 'α':'ω'
        return "?"
    else
        return string(ch)
    end
end

function clean(str)
    return join(map(transform, collect(str)))
end
