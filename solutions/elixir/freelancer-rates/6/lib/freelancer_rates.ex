defmodule FreelancerRates do
  @working_hours_per_day 8.0
  @working_days_per_month 22.0

  @spec daily_rate(integer()) :: float()
  def daily_rate(hourly_rate), do: @working_hours_per_day * hourly_rate

  @spec apply_discount(integer(), float()) :: float()
  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  @spec monthly_rate(integer(), float()) :: integer()
  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
    |> Kernel.*(@working_days_per_month)
    |> ceil()
  end

  @spec days_in_budget(integer(), integer(), float()) :: float()
  def days_in_budget(budget, hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
    |> then(& Kernel./(budget, &1))
    |> Float.floor(1)
  end
end
