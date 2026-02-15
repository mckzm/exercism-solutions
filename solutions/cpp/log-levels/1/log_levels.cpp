#include <string>

namespace log_line {
    // Log line format: `[LEVEL]: MESSAGE`
    std::string message(std::string line) {
        int msg_start_idx = line.find(":") + 2;
        return line.substr(msg_start_idx);
    }

    std::string log_level(std::string line) {
        int close_bracket_idx = line.find("]");
        return line.substr(1, close_bracket_idx - 1);
    }
    
    std::string reformat(std::string line) {
        return message(line) + " (" + log_level(line) + ")";
    }
}  // namespace log_line
