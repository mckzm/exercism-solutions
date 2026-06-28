defmodule Username do
  def sanitize(username) do
    # ä (228) becomes ae
    # ö (246) becomes oe
    # ü (252) becomes ue
    # ß (223) becomes ss

    # Please implement the sanitize/1 function
    case username do
      [] -> []
      _ -> sanitize_aux(username, [])
    end
  end

  defp sanitize_aux([], sanitized), do: sanitized

  defp sanitize_aux([car | cdr], sanitized) do
    case car do
      car when (car >= 97 and car <= 122) or car == 95 -> sanitize_aux(cdr, sanitized ++ [car])
      car when car in [223, 228, 246, 252] -> sanitize_aux(cdr, sanitized ++ transliterate(car))
      _ -> sanitize_aux(cdr, sanitized)
    end
  end

  defp transliterate(char) do
    case char do
      char when char == 223 -> ~c"ss"
      char when char == 228 -> ~c"ae"
      char when char == 246 -> ~c"oe"
      char when char == 252 -> ~c"ue"
    end
  end
end
