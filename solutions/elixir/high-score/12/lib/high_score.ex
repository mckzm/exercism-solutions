defmodule HighScore do
  @type scoreboard() :: %{optional(String.t()) => non_neg_integer()}

  @default_score 0

  @spec new() :: scoreboard()
  def new(), do: %{}

  @spec add_player(scoreboard(), String.t(), non_neg_integer()) :: scoreboard()
  def add_player(scores, name, score \\ @default_score), do: scores |> Map.put(name, score)

  @spec remove_player(scoreboard(), String.t()) :: scoreboard()
  def remove_player(scores, name), do: scores |> Map.delete(name)

  @spec reset_score(scoreboard(), String.t()) :: scoreboard()
  def reset_score(scores, name), do: scores |> Map.put(name, @default_score)

  @spec update_score(scoreboard(), String.t(), non_neg_integer()) :: scoreboard()
  def update_score(scores, name, score), do: scores |> Map.update(name, score, &(&1 + score))

  @spec get_players(scoreboard()) :: [String.t()]
  def get_players(scores), do: scores |> Map.keys()
end
