defmodule HighScore do
  def new(), do: %{}

  def add_player(scores, name), do: scores |> Map.merge(%{name => 0})

  def add_player(scores, name, score), do: scores |> Map.merge(%{name => score})

  def remove_player(scores, name), do: scores |> Map.drop([name])

  def reset_score(scores, name), do: scores |> Map.update(name, 0, fn _x -> 0 end)

  def update_score(scores, name, score), do: scores |> Map.update(name, score, fn x -> x + score end)

  def get_players(scores), do: scores |> Map.keys |> Enum.sort
end
