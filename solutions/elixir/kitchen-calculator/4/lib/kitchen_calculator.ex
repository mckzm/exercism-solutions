defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter({:cup, v}), do: {:milliliter, 240 * v}
  def to_milliliter({:fluid_ounce, v}), do: {:milliliter, 30 * v}
  def to_milliliter({:milliliter, v}), do: {:milliliter, 1 * v}
  def to_milliliter({:tablespoon, v}), do: {:milliliter, 15 * v}
  def to_milliliter({:teaspoon, v}), do: {:milliliter, 5 * v}

  def from_milliliter({_, v}, unit = :cup), do: {unit, v / 240}
  def from_milliliter({_, v}, unit = :fluid_ounce), do: {unit, v / 30}
  def from_milliliter(volume_pair, :milliliter), do: volume_pair
  def from_milliliter({_, v}, unit = :tablespoon), do: {unit, v / 15}
  def from_milliliter({_, v}, unit = :teaspoon), do: {unit, v / 5}

  def convert(v_pair, :milliliter), do: to_milliliter(v_pair)
  def convert(v_pair, to), do: v_pair |> to_milliliter() |> from_milliliter(to)
end
