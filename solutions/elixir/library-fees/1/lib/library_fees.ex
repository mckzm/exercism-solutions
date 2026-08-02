defmodule LibraryFees do
  def datetime_from_string(string), do: string |> NaiveDateTime.from_iso8601!()

  def before_noon?(datetime), do: datetime |> NaiveDateTime.to_time() |> Time.before?(~T[12:00:00])

  def return_date(checkout_datetime) do
    checkout_datetime
    |> NaiveDateTime.add(
      case before_noon?(checkout_datetime) do
        true -> 28
        false -> 29
      end,
      :day)
      |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    days_diff = planned_return_date
                |> Date.diff(NaiveDateTime.to_date(actual_return_datetime))
    if days_diff >= 0, do: 0, else: days_diff |> abs()
  end

  def monday?(datetime) do
    datetime |> NaiveDateTime.to_date() |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_return_date = checkout |> datetime_from_string() |> return_date()
    actual_return_datetime = return |> datetime_from_string()
    days_diff = days_late(planned_return_date, actual_return_datetime)
    effective_rate = case monday?(actual_return_datetime) do
      true -> rate * 0.5
      false -> rate
    end
    trunc(days_diff * effective_rate)
  end
end
