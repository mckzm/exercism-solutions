defmodule NameBadge do
  def print(id, name, department) do
    id_str = if id, do: "[#{id}] - ", else: "" 
    dpt = if department, do: String.upcase(department), else: "OWNER"
    "#{id_str}#{name} - #{dpt}"
  end
end
