probabilities = ./
rationalize = .//

function checkmean(successes, trials)
    l = length(successes)
    rat_mean = sum(rationalize(successes, trials)) // l
    float_mean = sum(probabilities(successes, trials)) / l

    return float(rat_mean) == float_mean || rat_mean
end

function checkprob(successes, trials)
    rat_probs = reduce(*, rationalize(successes, trials))
    float_probs = reduce(*, probabilities(successes, trials))

    return float(rat_probs) == float_probs || rat_probs
end
