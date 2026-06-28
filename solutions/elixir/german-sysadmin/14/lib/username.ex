defmodule Username do
  @transliterations %{
    ?ß => ~c"ss",
    ?ä => ~c"ae",
    ?ö => ~c"oe",
    ?ü => ~c"ue"
  }

  @spec sanitize([char()]) :: [char()]
  def sanitize([]), do: []
  def sanitize(username), do: sanitize_aux(username, [])

  @spec sanitize_aux([char()], [char()]) :: [char()]
  defp sanitize_aux([], sanitized), do: sanitized |> Enum.reverse()
  defp sanitize_aux([h | t], sanitized) do
    case h do
      h when h in ?a..?z  or h == ?_ -> sanitize_aux(t, [h | sanitized])
      h when h in [?ß, ?ä, ?ö, ?ü] -> sanitize_aux(@transliterations[h] ++ t, sanitized)
      _ -> sanitize_aux(t, sanitized)
    end
  end
end
