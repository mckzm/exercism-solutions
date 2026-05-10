defmodule Lasagna do
  @spec expected_minutes_in_oven :: integer()
  def expected_minutes_in_oven(), do: 40

  @spec remaining_minutes_in_oven(integer()) :: integer()
  def remaining_minutes_in_oven(min_in_oven) do
    expected_minutes_in_oven() - min_in_oven
  end

  @spec preparation_time_in_minutes(integer()) :: integer()
  def preparation_time_in_minutes(layers) do
    layers * preparation_time_per_layer()
  end

  @spec preparation_time_per_layer() :: integer()
  def preparation_time_per_layer, do: 2

  @spec total_time_in_minutes(integer(), integer()) :: integer()
  def total_time_in_minutes(layers, min_in_oven) do
    preparation_time_in_minutes(layers) + min_in_oven
  end

  @spec alarm() :: String.t()
  def alarm(), do: "Ding!"
end
