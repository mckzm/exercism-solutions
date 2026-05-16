using Statistics

probabilities = ./
rationalize = .//

function checkmean(successes, trials)
    rat_mean = mean(rationalize(successes, trials))
    float_mean = mean(probabilities(successes, trials))

    return float(rat_mean) == float_mean || rat_mean
end

function checkprob(successes, trials)
    rat_prob = prod(rationalize(successes, trials))
    float_prob = prod(probabilities(successes, trials))

    return float(rat_prob) == float_prob || rat_prob
end
