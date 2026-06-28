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
      car when car == 223 -> sanitize_aux(cdr, sanitized ++ ~c"ss")
      car when car == 228 -> sanitize_aux(cdr, sanitized ++ ~c"ae")
      car when car == 246 -> sanitize_aux(cdr, sanitized ++ ~c"oe")
      car when car == 252 -> sanitize_aux(cdr, sanitized ++ ~c"ue")
      _ -> sanitize_aux(cdr, sanitized)
    end
  end
end
