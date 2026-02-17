#include <cmath>

constexpr double WORKING_HOURS_PER_DAY = 8.0;
constexpr double WORKING_DAYS_PER_MONTH = 22.0;

// daily_rate calculates the daily rate given an hourly rate
double daily_rate(double hourly_rate) {
    return hourly_rate * WORKING_HOURS_PER_DAY;
}

// apply_discount calculates the price after a discount
double apply_discount(double before_discount, double discount) {
    return before_discount - (before_discount * discount / 100.0);
}

// monthly_rate calculates the monthly rate, given an hourly rate and a discount
// The returned monthly rate is rounded up to the nearest integer.
int monthly_rate(double hourly_rate, double discount) {
    return std::ceil(apply_discount(daily_rate(hourly_rate) * WORKING_DAYS_PER_MONTH, discount));
}

// days_in_budget calculates the number of workdays given a budget, hourly rate,
// and discount The returned number of days is rounded down (take the floor) to
// the next integer.
int days_in_budget(int budget, double hourly_rate, double discount) {
    return std::floor(budget / apply_discount(daily_rate(hourly_rate), discount));
}
