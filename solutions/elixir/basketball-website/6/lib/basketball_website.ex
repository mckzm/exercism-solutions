defmodule BasketballWebsite do
  @type team_data ::
          String.t()
          | number()
          | nil
          | %{String.t() => team_data}

  @spec extract_from_path(team_data(), String.t()) :: team_data()
  def extract_from_path(data, path), do: do_extract_from_path(data, keys(path))

  @spec do_extract_from_path(team_data(), [String.t()]) :: team_data()
  defp do_extract_from_path(nil, _path), do: nil
  defp do_extract_from_path(data, []), do: data
  defp do_extract_from_path(data, [h | t]), do: do_extract_from_path(data[h], t)

  @spec get_in_path(team_data(), String.t()) :: team_data()
  def get_in_path(data, path), do: Kernel.get_in(data, keys(path))

  @spec keys(String.t()) :: [String.t()]
  defp keys(path), do: String.split(path, ".", trim: true)
end
