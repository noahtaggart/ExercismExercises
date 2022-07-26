defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    do_extract_from_path(data, keys(path))
  end

  # if path is empty, return data
  defp do_extract_from_path(data, []), do: data

  # if path isn't empty, splits path and checks against data
  defp do_extract_from_path(data, [key | rest]) do
    do_extract_from_path(data[key], rest)
   end

  def get_in_path(data, path) do
    get_in(data, keys(path))
  end

  # splts path on "." and trims out the period
  defp keys(path) do
    String.split(path, ".")
  end
end
