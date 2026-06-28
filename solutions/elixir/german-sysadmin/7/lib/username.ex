defmodule Username do
  @spec sanitize([char()]) :: [char()]
  def sanitize(username) do
    # ä (228) becomes ae
    # ö (246) becomes oe
    # ü (252) becomes ue
    # ß (223) becomes ss

    case username do
      [] -> []
      _ -> sanitize_aux(username, [])
    end
  end

  @spec sanitize_aux([char()], [char()]) :: [char()]
  defp sanitize_aux([], sanitized), do: sanitized
  defp sanitize_aux([h | t], sanitized) do
    case h do
      h when (h >= 97 and h <= 122) or h == 95 -> sanitize_aux(t, sanitized ++ [h])
      h when h in [?ß, ?ä, ?ö, ?ü] -> sanitize_aux(t, sanitized ++ transliterate(h))
      _ -> sanitize_aux(t, sanitized)
    end
  end

  @spec transliterate(char()) :: [char()]
  defp transliterate(char) do
    case char do
      char when char == ?ß -> ~c"ss"
      char when char == ?ä -> ~c"ae"
      char when char == ?ö -> ~c"oe"
      char when char == ?ü -> ~c"ue"
    end
  end
end
