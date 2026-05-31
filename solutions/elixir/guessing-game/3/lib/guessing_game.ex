defmodule GuessingGame do
  def compare(secret, guess \\ :missing_guess)
  def compare(_, guess) when is_atom(guess), do: "Make a guess"
  def compare(secret, guess) when secret === guess, do: "Correct"
  def compare(secret, guess) when abs(secret - guess) === 1, do: "So close"
  def compare(secret, guess) when secret < guess, do: "Too high"
  def compare(secret, guess) when secret > guess, do: "Too low"
end
