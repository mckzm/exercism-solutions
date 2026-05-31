defmodule KitchenCalculator do
  def get_volume({_, v}), do: v

  def to_milliliter({:milliliter, v}), do: {:milliliter, v}
  def to_milliliter({:cup, v}), do: {:milliliter, v * 240}
  def to_milliliter({:fluid_ounce, v}), do: {:milliliter, v * 30}
  def to_milliliter({:tablespoon, v}), do: {:milliliter, v * 15}
  def to_milliliter({:teaspoon, v}), do: {:milliliter, v * 5}

  def from_milliliter(v_pair, :milliliter), do: v_pair
  def from_milliliter({_, v}, unit = :cup), do: {unit, v / 240}
  def from_milliliter({_, v}, unit = :fluid_ounce), do: {unit, v / 30}
  def from_milliliter({_, v}, unit = :tablespoon), do: {unit, v / 15}
  def from_milliliter({_, v}, unit = :teaspoon), do: {unit, v / 5}

  def convert(v_pair, :milliliter), do: to_milliliter(v_pair)
  def convert(v_pair, to), do: v_pair |> to_milliliter() |> from_milliliter(to)
end

