defmodule WineCellar do
  @type bottle_data :: {String.t(), integer(), String.t()}
  @type color :: :white | :red | :rose
  @type color_description :: {color, String.t()}
  @type opt :: {:year, integer()} | {:country, String.t()}
  @type wine :: {color, bottle_data()}

  @spec explain_colors() :: [color_description()]
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  @spec filter([wine()], color(), [opt()]) :: [bottle_data()]
  def filter(cellar, color, opts \\ []) do
    cellar
    |> Keyword.get_values(color)
    |> maybe_filter(opts[:year], &filter_by_year/2)
    |> maybe_filter(opts[:country], &filter_by_country/2)
  end

  @spec maybe_filter([bottle_data()], integer() | String.t(), fun()) :: [bottle_data()]
  defp maybe_filter(wines, nil, _), do: wines
  defp maybe_filter(wines, opt, filter_fn), do: wines |> filter_fn.(opt)

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
