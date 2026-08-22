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
  def sanitize(username), do: do_sanitize(username, [])

  @spec do_sanitize([char()], [char()]) :: [char()]
  defp do_sanitize([], sanitized), do: sanitized |> Enum.reverse()
  defp do_sanitize([h | t], sanitized) do
    case h do
      h when h in @allowed_chars -> do_sanitize(t, [h | sanitized])
      h when h in @german_chars -> do_sanitize(@transliterations[h] ++ t, sanitized)
      _ -> do_sanitize(t, sanitized)
    end
  end
end
