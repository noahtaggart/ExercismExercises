defmodule BirdCount do
  def today(list) do
    List.first(list)
  end

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]) do
    [head + 1 | tail]

  end

  def has_day_without_birds?(list) do
    Enum.member?(list, 0)
  end

  def total(list) do
    Enum.sum(list)
  end

  def busy_days(list) do
    Enum.filter(list, fn x -> x >= 5 end) |> length()
  end
end
