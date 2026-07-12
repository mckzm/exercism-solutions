defmodule NameBadge do
  @spec print(integer() | nil, String.t(), String.t() | nil) :: String.t()
  def print(id, name, department) do
    id_prefix = if id, do: "[#{id}] - ", else: "" 
    dpt = if department, do: String.upcase(department), else: "OWNER"

    "#{id_prefix}#{name} - #{dpt}"
  end
end
