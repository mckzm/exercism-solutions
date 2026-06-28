defmodule Username do
  @transliterations %{
    ?ß => ~c"ss",
    ?ä => ~c"ae",
    ?ö => ~c"oe",
    ?ü => ~c"ue"
  }

  @spec sanitize([char()]) :: [char()]
  def sanitize(username) do

    case username do
      [] -> []
      _ -> sanitize_aux(username, [])
    end
  end

  @spec sanitize_aux([char()], [char()]) :: [char()]
  defp sanitize_aux([], sanitized), do: sanitized
  defp sanitize_aux([h | t], sanitized) do
    case h do
      h when h in ?a..?z  or h == ?_ -> sanitize_aux(t, sanitized ++ [h])
      h when h in [?ß, ?ä, ?ö, ?ü] -> sanitize_aux(t, sanitized ++ @transliterations[h])
      _ -> sanitize_aux(t, sanitized)
    end
  end
end
