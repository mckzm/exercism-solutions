function transform(ch)
    ch == '-'                    && return "_"
    (isspace(ch) || isdigit(ch)) && return ""
    isuppercase(ch)              && return "-$(lowercase(ch))"
    ch in 'α':'ω'                && return "?"

    return string(ch)
end

clean(str) = join(transform.(collect(str)))
