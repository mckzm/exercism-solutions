#include <array>
#include <string>
#include <stdexcept>
#include <vector>

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
    std::vector<int> truncated{};
    for (int i{}; i < student_scores.size(); ++i) {
        truncated.emplace_back(static_cast<int>(student_scores.at(i)));
    }
    return truncated;
}

// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {
    int failing{};
    for (int i{}; i < student_scores.size(); ++i) {
        if (student_scores.at(i) <= 40) ++failing;
    }
    return failing;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {
    int interval{(highest_score - 40) / 4};
    int current_threshold{41};
    std::array<int, 4> thresholds{};

    for (int i{}; i < 4; ++i) {
        thresholds[i] = current_threshold;
        current_threshold += interval;
    }

    return thresholds;
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(
    std::vector<int> student_scores, std::vector<std::string> student_names) {
    if (student_scores.size() != student_names.size()) {
        throw std::domain_error("Vector sizes should be equal.");
    }

    std::vector<std::string> names_and_scores{};

    for (int i{}; i < student_scores.size(); ++i) {
        names_and_scores.emplace_back(
                std::to_string(i + 1) +
                ". " +
                student_names.at(i) +
                ": " +
                std::to_string(student_scores.at(i))
        );
    }

    return names_and_scores;
}

// Create a string that contains the name of the first student to make a perfect
// score on the exam.
std::string perfect_score(std::vector<int> student_scores,
                          std::vector<std::string> student_names) {
    if (student_scores.size() != student_names.size()) {
        throw std::domain_error("Vector sizes should be equal.");
    }

    for (int i{}; i < student_scores.size(); ++i) {
        if (student_scores.at(i) == 100) return student_names.at(i);
    }

    return "";
}
