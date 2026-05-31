defmodule GuessingGame do
  @spec compare(integer(), integer() | :no_guess) :: String.t()
  def compare(secret, guess \\ :no_guess)

  def compare(_, :no_guess), do: "Make a guess"
  def compare(s, s), do: "Correct"
  def compare(s, g) when abs(s - g) === 1, do: "So close"
  def compare(s, g) when s < g, do: "Too high"
  def compare(s, g) when s > g, do: "Too low"
end
