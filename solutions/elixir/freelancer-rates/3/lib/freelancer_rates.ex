defmodule FreelancerRates do
  @working_hours_per_day 8.0
  @working_days_per_month 22.0

  def daily_rate(hourly_rate), do: @working_hours_per_day * hourly_rate

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate)
    |> apply_discount(discount)
    |> Kernel.*(@working_days_per_month)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / apply_discount(daily_rate(hourly_rate), discount), 1)
  end
end
