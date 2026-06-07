defmodule BirdCount do
  def today([]), do: nil
  def today([head | _]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | tail]), do: has_day_without_birds?(tail)

  # Outside the context of this exercise: Enum.sum/1 or Enum.reduce/2
  def total(list), do: total_acc(list, 0)

  # Outside the context of this exercise: Enum.count/2
  def busy_days(list), do: busy_days_acc(list, 0)

  # --- Private Accumulator-Pattern Helpers ---
  defp total_acc([], acc), do: acc
  defp total_acc([head | tail], acc), do: total_acc(tail, acc + head)

  defp busy_days_acc([], acc), do: acc
  defp busy_days_acc([head | tail], acc) when head >= 5, do: busy_days_acc(tail, acc + 1)
  defp busy_days_acc([_ | tail], acc), do: busy_days_acc(tail, acc)
end
