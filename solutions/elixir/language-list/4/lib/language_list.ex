defmodule LanguageList do
  @spec new() :: []
  def new() do
    []
  end

  @spec add(list(), String.t()) :: list()
  def add(list, language) do
    [language | list]
  end

  @spec remove(list(String.t())) :: list(String.t())
  def remove(list) do
    [_head | tail] = list
    tail
  end

  @spec first(list(String.t())) :: String.t()
  def first(list) do
    [head | _tail] = list
    head
  end

  # In lieu of Kernel.count/1
  @spec count(list(String.t())) :: integer()
  def count(list) do
    count_acc(list, 0)
  end

  @spec functional_list?(list(String.t())) :: boolean()
  def functional_list?(list) do
    "Elixir" in list
  end

  @spec count_acc(list(String.t()), integer()) :: integer()
  defp count_acc([], acc), do: acc
  defp count_acc([_head | tail], acc), do: count_acc(tail, acc + 1)
end
