#include <string>
#include <vector>

namespace election {

    struct ElectionResult {
        // Name of the candidate
        std::string name{};
        // Number of votes the candidate has
        int votes{};
    };
    
    int vote_count(ElectionResult& res) {
        return res.votes;
    }

    void increment_vote_count(ElectionResult& res, int votes) {
        res.votes += votes;
    }

    ElectionResult& determine_result(std::vector<ElectionResult>& results) {
        int candidate_idx = 0;

        for (int i{1}; i < results.size(); ++i) {
            if (vote_count(results.at(i)) > vote_count(results.at(candidate_idx))) {
                candidate_idx = i;
            }
        }

        ElectionResult& winner = results.at(candidate_idx);
        winner.name = "President " + winner.name;

        return winner;
    }
    
}  // namespace election
