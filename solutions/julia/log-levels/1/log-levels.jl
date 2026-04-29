function message(msg)
    return strip(split(msg, ':')[2])
end

function log_level(msg)
    return lowercase(split(msg, ':')[1][begin + 1:end - 1])
end

function reformat(msg)
    return "$(message(msg)) ($(log_level(msg)))"
end
