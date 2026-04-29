log_level(msg) = lowercase(split(msg, ':')[1][begin + 1:end - 1])
message(msg) = strip(split(msg, ':')[2])
reformat(msg) = "$(message(msg)) ($(log_level(msg)))"
