defmodule Username do
  @allowed_chars [?_ | Enum.to_list(?a..?z)]
  @transliterations %{
    ?ß => ~c"ss",
    ?ä => ~c"ae",
    ?ö => ~c"oe",
    ?ü => ~c"ue"
  }
  @german_chars Map.keys(@transliterations)

  @spec sanitize([char()]) :: [char()]
  def sanitize([]), do: []
  def sanitize(username), do: sanitize_aux(username, [])

  @spec sanitize_aux([char()], [char()]) :: [char()]
  defp sanitize_aux([], sanitized), do: sanitized |> Enum.reverse()
  defp sanitize_aux([h | t], sanitized) do
    case h do
      h when h in @allowed_chars -> sanitize_aux(t, [h | sanitized])
      h when h in @german_chars -> sanitize_aux(@transliterations[h] ++ t, sanitized)
      _ -> sanitize_aux(t, sanitized)
    end
  end
end
