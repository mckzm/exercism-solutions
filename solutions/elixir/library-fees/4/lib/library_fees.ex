defmodule LibraryFees do
  def datetime_from_string(string), do: string |> NaiveDateTime.from_iso8601!()

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.before?(~T[12:00:00])
  end

  def return_date(checkout_datetime) do
    days_to_add = if before_noon?(checkout_datetime), do: 28, else: 29

    checkout_datetime
    |> NaiveDateTime.add(days_to_add, :day)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    days_diff =
      actual_return_datetime
      |> NaiveDateTime.to_date()
      |> Date.diff(planned_return_date)

    if days_diff <= 0, do: 0, else: days_diff
  end

  def monday?(datetime) do
    datetime |> NaiveDateTime.to_date() |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_return_date = checkout |> datetime_from_string() |> return_date()
    actual_return_datetime = return |> datetime_from_string()
    days_diff = days_late(planned_return_date, actual_return_datetime)

    effective_rate =
      case monday?(actual_return_datetime) do
        true -> rate * 0.5
        false -> rate
      end

    trunc(days_diff * effective_rate)
  end
end
