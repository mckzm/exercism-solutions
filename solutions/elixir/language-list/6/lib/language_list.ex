defmodule LanguageList do
  @spec new() :: []
  def new(), do: []

  @spec add(list(String.t()), String.t()) :: list(String.t())
  def add(list, language), do: [language | list]

  @spec remove(nonempty_list(String.t())) :: list(String.t())
  def remove([_head | tail]), do: tail

  @spec first(nonempty_list(String.t())) :: String.t()
  def first([head | _tail]), do: head

  # In lieu of Kernel.count/1
  @spec count(list(String.t())) :: integer()
  def count(list), do: count_acc(list, 0)

  @spec functional_list?(list(String.t())) :: boolean()
  def functional_list?(list), do: "Elixir" in list

  @spec count_acc(list(String.t()), integer()) :: integer()
  defp count_acc([], acc), do: acc
  defp count_acc([_head | tail], acc), do: count_acc(tail, acc + 1)
end
