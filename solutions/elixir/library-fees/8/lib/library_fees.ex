defmodule LibraryFees do
  @spec datetime_from_string(String.t()) :: NaiveDateTime.t()
  def datetime_from_string(string), do: string |> NaiveDateTime.from_iso8601!()

  @spec before_noon?(NaiveDateTime.t()) :: boolean()
  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.before?(~T[12:00:00])
  end

  @spec return_date(NaiveDateTime.t()) :: Date.t()
  def return_date(checkout_datetime) do
    checkout_datetime
    |> NaiveDateTime.to_date()
    |> Date.add(if before_noon?(checkout_datetime), do: 28, else: 29)
  end

  @spec days_late(Date.t(), NaiveDateTime.t()) :: integer()
  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> max(0)
  end

  @spec monday?(NaiveDateTime.t()) :: boolean()
  def monday?(datetime) do
    datetime |> NaiveDateTime.to_date() |> Date.day_of_week() == 1
  end

  @spec calculate_late_fee(String.t(), String.t(), integer()) :: integer()
  def calculate_late_fee(checkout, return, rate) do
    planned_return_date = checkout |> datetime_from_string() |> return_date()
    actual_return_datetime = return |> datetime_from_string()

    days_late = days_late(planned_return_date, actual_return_datetime)
    final_rate = if monday?(actual_return_datetime), do: rate * 0.5, else: rate

    trunc(days_late * final_rate)
  end
end
