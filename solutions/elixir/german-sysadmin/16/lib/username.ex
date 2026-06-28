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
  defp sanitize_aux([h | t], sanitized) when h in ?a..?z  or h == ?_, do: sanitize_aux(t, [h | sanitized])
  defp sanitize_aux([h | t], sanitized) when h in [?ß, ?ä, ?ö, ?ü], do: sanitize_aux(@transliterations[h] ++ t, sanitized)
  defp sanitize_aux([_ | t], sanitized), do: sanitize_aux(t, sanitized)
end
