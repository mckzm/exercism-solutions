defmodule BirdCount do
  @type bird_list :: [non_neg_integer()]

  @busy_day_threshold 5

  @spec today(bird_list()) :: non_neg_integer() | nil
  def today([]), do: nil
  def today([h | _]), do: h

  @spec increment_day_count(bird_list()) :: bird_list()
  def increment_day_count([]), do: [1]
  def increment_day_count([h | t]), do: [h + 1 | t]

  @spec has_day_without_birds?(bird_list()) :: boolean()
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | t]), do: has_day_without_birds?(t)

  # Outside the context of this exercise: Enum.sum/1 or Enum.reduce/2
  @spec total(bird_list()) :: non_neg_integer()
  def total(list), do: do_total(list, 0)

  # Outside the context of this exercise: Enum.count/2
  @spec busy_days(bird_list()) :: non_neg_integer()
  def busy_days(list), do: do_busy_days(list, 0)

  # --- Private Accumulator-Pattern Helpers ---
  @spec do_total(bird_list(), non_neg_integer()) :: non_neg_integer()
  defp do_total([], acc), do: acc
  defp do_total([h | t], acc), do: do_total(t, acc + h)

  @spec do_busy_days(bird_list(), non_neg_integer()) :: non_neg_integer()
  defp do_busy_days([], acc), do: acc
  defp do_busy_days([h | t], acc) when h >= @busy_day_threshold, do: do_busy_days(t, acc + 1)
  defp do_busy_days([_ | t], acc), do: do_busy_days(t, acc)
end
