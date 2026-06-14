defmodule HighScore do
  def new(), do: %{}

  def add_player(scores, name), do: Map.merge(scores, %{name => 0})

  def add_player(scores, name, score), do: Map.merge(scores, %{name => score})

  def remove_player(scores, name), do: Map.drop(scores, [name])

  def reset_score(scores, name), do: Map.update(scores, name, 0, fn _x -> 0 end)

  def update_score(scores, name, score), do: Map.update(scores, name, score, fn x -> x + score end)

  def get_players(scores), do: scores |> Map.keys |> Enum.sort
end
