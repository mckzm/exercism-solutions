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
    def from_milliliter({:milliliter, v}, to = unquote(unit)) do
      converted_v = v / unquote(rate)

      # The tests don't check against a consistent numeric type: numbers
      # without a fractional part are specified as integer literals, not
      # float literals. The code below adjusts the converted volume
      # accordingly.
      truncated_v = trunc(converted_v)
      type_adjusted_v =
        case {converted_v, truncated_v} do
          {float, int} when float == int -> int
          {float, _} -> float
        end

      {to, type_adjusted_v}
    end
  end

  def convert(v_pair, :milliliter), do: to_milliliter(v_pair)
  def convert(v_pair, to), do: v_pair |> to_milliliter() |> from_milliliter(to)
end

