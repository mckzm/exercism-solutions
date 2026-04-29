log_level(msg) = lowercase(split_msg(msg)[1][begin + 1:end - 1])
message(msg) = strip(split_msg(msg)[2])
reformat(msg) = "$(message(msg)) ($(log_level(msg)))"
split_msg(msg) = split(msg, ':')
