defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    days_to_add = case before_noon?(checkout_datetime) do
      true -> 28
      false -> 29
    end
    checkout_datetime |> NaiveDateTime.to_date() |> Date.add(days_to_add)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    days_diff = Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date)
    if days_diff <= 0 do
      0
    else
      days_diff
    end
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    return_datetime = datetime_from_string(return)
    days_late =
      checkout
      |> datetime_from_string()
      |> return_date()
      |>days_late(return_datetime)
      fee = rate * days_late
      if monday?(return_datetime), do: div(fee, 2), else: fee
  end
end
