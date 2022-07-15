defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance_squared =  x * x + y * y
    cond do
      distance_squared > 100 -> 0
      distance_squared > 25 -> 1
      distance_squared > 1 -> 5
      true -> 10

    end
  end
end
