defmodule LanguageList do
  @spec new() :: []
  def new(), do: []

  @spec add(list(String.t()), String.t()) :: list(String.t())
  def add(list, language), do: [language | list]

  @spec remove(nonempty_list(String.t())) :: list(String.t())
  def remove([_ | tail]), do: tail

  @spec first(nonempty_list(String.t())) :: String.t()
  def first([head | _]), do: head

  # In lieu of Kernel.count/1
  @spec count(list(String.t())) :: integer()
  def count(list), do: do_count(list, 0)

  @spec functional_list?(list(String.t())) :: boolean()
  def functional_list?(list), do: "Elixir" in list

  @spec do_count(list(String.t()), integer()) :: integer()
  defp do_count([], acc), do: acc
  defp do_count([_ | tail], acc), do: do_count(tail, acc + 1)
end
