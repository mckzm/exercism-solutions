function rationalize(successes, trials)
    res = [];
    for i in 1:length(successes)
        push!(res, successes[i] // trials[i])
    end

    return res
end

function probabilities(successes, trials)
    res = [];
    for i in 1:length(successes)
        push!(res, successes[i] / trials[i])
    end

    return res
end

function checkmean(successes, trials)
    l = length(successes)
    rat_mean = reduce(+, rationalize(successes, trials)) // l
    float_mean = reduce(+, probabilities(successes, trials)) / l

    return float(rat_mean) == float_mean ? true : rat_mean
end

function checkprob(successes, trials)
    rat_probs = reduce(*, rationalize(successes, trials))
    float_probs = reduce(*, probabilities(successes, trials))

    return float(rat_probs) == float_probs ? true : rat_probs
end
