defmodule KitchenCalculator do
  @conversion_map %{
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15,
    milliliter: 1,
  }

  def get_volume({_, v}), do: v

  for {unit, rate} <- @conversion_map do
    def to_milliliter({unquote(unit), v}), do: {:milliliter, v * unquote(rate)}
  end

  for {unit, rate} <- @conversion_map do
    def from_milliliter({:milliliter, v}, unquote(unit))do
      converted_v = v / unquote(rate)
      type_adjusted_v =
        if converted_v == trunc(converted_v) do
          trunc(converted_v)
        else
          converted_v
        end
      {unquote(unit), type_adjusted_v}
    end
  end

  def convert(v_pair, :milliliter), do: to_milliliter(v_pair)
  def convert(v_pair, to), do: v_pair |> to_milliliter() |> from_milliliter(to)
end

