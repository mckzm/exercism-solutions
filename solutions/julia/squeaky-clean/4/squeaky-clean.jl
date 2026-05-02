function transform(ch)
    return if ch == '-'
        "_"
    elseif isspace(ch) || isdigit(ch)
        ""
    elseif isuppercase(ch)
        "-$(lowercase(ch))"
    elseif ch in 'α':'ω'
        "?"
    else
        string(ch)
    end
end

clean(str) = join(map(transform, collect(str)))
