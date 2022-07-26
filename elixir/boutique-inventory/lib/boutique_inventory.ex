defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn item -> item.price end )
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> item.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      Map.update(item, :name, new_word, fn name -> String.replace(name, old_word, new_word) end)
    end)
  end

  def increase_quantity(item, count) do
    default= %{s: count, m: count, l: count, xl: count}
    Map.update(item, :quantity_by_size, default, fn old_count ->
      Map.new(old_count, fn {size, old_num} -> {size, old_num + count} end)
    end)
  end

  def total_quantity(item) do
    %{quantity_by_size: sizes} = item

    Enum.reduce(sizes, 0, fn {_, n}, acc->acc + n end)
  end
end
