#include <array>
#include <string>
#include <stdexcept>
#include <vector>

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
    std::vector<int> floored{};
    for (double score: student_scores) floored.emplace_back(static_cast<int>(score));
    return floored;
}

// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {
    int failed{};
    for (int score: student_scores) failed += (score <= 40) ? 1 : 0;
    return failed;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {
    int interval{(highest_score - 40) / 4};
    std::array<int, 4> thresholds{41, 0, 0, 0};

    for (int i{1}; i < 4; ++i) {
        thresholds.at(i) = thresholds.at(i - 1) + interval;
    }

    return thresholds;
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(std::vector<int> student_scores, std::vector<std::string> student_names) {
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
std::string perfect_score(std::vector<int> student_scores, std::vector<std::string> student_names) {
    if (student_scores.size() != student_names.size()) {
        throw std::domain_error("Vector sizes should be equal.");
    }

    for (int i{}; i < student_scores.size(); ++i) {
        if (student_scores.at(i) == 100) return student_names.at(i);
    }

    return "";
}
