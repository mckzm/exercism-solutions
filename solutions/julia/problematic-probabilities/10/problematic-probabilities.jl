using Statistics

probabilities = ./
rationalize = .//

checkmean(successes, trials) = cmp_rats_and_floats(mean, successes, trials)
checkprob(successes, trials) = cmp_rats_and_floats(prod, successes, trials)

function cmp_rats_and_floats(f, successes, trials)
    rats = f(rationalize(successes, trials))
    floats = f(probabilities(successes, trials))

    return float(rats) == floats || rats
end
