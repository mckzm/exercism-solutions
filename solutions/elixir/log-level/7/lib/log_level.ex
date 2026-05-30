defmodule LogLevel do
  @spec to_label(integer(), boolean()) :: atom()
  def to_label(level, legacy?) do
    cond do
      level === 0 && !legacy? -> :trace
      level === 1 -> :debug
      level === 2 -> :info
      level === 3 -> :warning
      level === 4 -> :error
      level === 5 && !legacy? -> :fatal
      true -> :unknown
    end
  end

  @type recipient :: :dev1 | :dev2 | :ops

  @spec alert_recipient(integer(), boolean()) :: recipient() | false
  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label in [:error, :fatal] -> :ops
      label === :unknown && legacy? -> :dev1
      label === :unknown && !legacy? -> :dev2
      true -> false
    end
  end
end
