defmodule HighSchoolSweetheart do
  def first_letter(name), do: name |> String.trim |> String.first

  def initial(name), do: name |> String.upcase |> first_letter |> Kernel.<>(".")

  def initials(full_name) do
    full_name
    |> String.split
    |> Enum.map(fn s -> s |> initial end)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
  end
end
