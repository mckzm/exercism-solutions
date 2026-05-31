defmodule GuessingGame do
  def compare(secret, guess \\ :missing_guess)
  def compare(_secret, guess) when is_atom(guess), do: "Make a guess"
  def compare(secret, guess) when secret === guess, do: "Correct"
  def compare(secret, guess) when secret + 1 === guess, do: "So close"
  def compare(secret, guess) when secret - 1 === guess, do: "So close"
  def compare(secret, guess) when secret < guess, do: "Too high"
  def compare(secret, guess) when secret > guess, do: "Too low"
end
