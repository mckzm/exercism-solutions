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
      h when h in [223, 228, 246, 252] -> sanitize_aux(t, sanitized ++ transliterate(h))
      _ -> sanitize_aux(t, sanitized)
    end
  end

  @spec transliterate(char()) :: [char()]
  defp transliterate(char) do
    case char do
      char when char == 223 -> ~c"ss"
      char when char == 228 -> ~c"ae"
      char when char == 246 -> ~c"oe"
      char when char == 252 -> ~c"ue"
    end
  end
end
