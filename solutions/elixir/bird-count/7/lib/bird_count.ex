defmodule BirdCount do
  @type bird_list :: [non_neg_integer()]

  @busy_day_threshold 5

  @spec today(bird_list()) :: non_neg_integer() | nil
  def today([]), do: nil
  def today([head | _]), do: head

  @spec increment_day_count(bird_list()) :: bird_list()
  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  @spec has_day_without_birds?(bird_list()) :: boolean()
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | tail]), do: has_day_without_birds?(tail)

  # Outside the context of this exercise: Enum.sum/1 or Enum.reduce/2
  @spec total(bird_list()) :: non_neg_integer()
  def total(list), do: total_acc(list, 0)

  # Outside the context of this exercise: Enum.count/2
  @spec busy_days(bird_list()) :: non_neg_integer()
  def busy_days(list), do: busy_days_acc(list, 0)

  # --- Private Accumulator-Pattern Helpers ---
  @spec total_acc(bird_list(), non_neg_integer()) :: non_neg_integer()
  defp total_acc([], acc), do: acc
  defp total_acc([head | tail], acc), do: total_acc(tail, acc + head)

  @spec busy_days_acc(bird_list(), non_neg_integer()) :: non_neg_integer()
  defp busy_days_acc([], acc), do: acc
  defp busy_days_acc([head | tail], acc) when head >= @busy_day_threshold, do: busy_days_acc(tail, acc + 1)
  defp busy_days_acc([_ | tail], acc), do: busy_days_acc(tail, acc)
end
