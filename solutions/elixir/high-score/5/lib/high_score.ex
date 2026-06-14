defmodule HighScore do
  @default_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @default_score), do: scores |> Map.merge(%{name => score})

  def remove_player(scores, name), do: scores |> Map.drop([name])

  def reset_score(scores, name), do: scores |> Map.update(name, 0, fn _x -> @default_score end)

  def update_score(scores, name, score), do: scores |> Map.update(name, score, fn x -> x + score end)

  def get_players(scores), do: scores |> Map.keys |> Enum.sort
end
