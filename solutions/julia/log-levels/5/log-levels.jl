split_msg(msg) = split(replace(msg, "[" => ""), "]:")

log_level = lowercase ∘ first ∘ split_msg
message = strip ∘ last ∘ split_msg
reformat(msg) = "$(message(msg)) ($(log_level(msg)))"
