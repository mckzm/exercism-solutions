#include <string>

namespace log_line {
    // Log line format: `[LEVEL]: MESSAGE`
    std::string message(std::string line) {
        int msg_start_idx = line.find(":") + 2;
        return line.substr(msg_start_idx);
    }

    std::string log_level(std::string line) {
        int level_start_idx = line.find("[") + 1;
        int level_length = line.find("]") - level_start_idx;
        return line.substr(level_start_idx, level_length);
    }
    
    std::string reformat(std::string line) {
        return message(line) + " (" + log_level(line) + ")";
    }
}  // namespace log_line
