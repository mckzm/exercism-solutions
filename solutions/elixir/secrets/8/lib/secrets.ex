defmodule Secrets do
  @type secret_op :: (integer() -> integer())

  @spec secret_add(integer()) :: secret_op()
  def secret_add(secret), do: &(&1 |> Kernel.+(secret))

  @spec secret_subtract(integer()) :: secret_op()
  def secret_subtract(secret), do: &(&1 |> Kernel.-(secret))

  @spec secret_multiply(integer()) :: secret_op()
  def secret_multiply(secret), do: &(&1 |> Kernel.*(secret))

  @spec secret_divide(integer()) :: secret_op()
  def secret_divide(secret), do: &(&1 |> div(secret))

  @spec secret_and(integer()) :: secret_op()
  def secret_and(secret), do: &(&1 |> Bitwise.band(secret))

  @spec secret_xor(integer()) :: secret_op()
  def secret_xor(secret), do: &(&1 |> Bitwise.bxor(secret))

  @spec secret_combine(secret_op(), secret_op()) :: secret_op()
  def secret_combine(secret_function1, secret_function2) do
    &(
      &1
      |> secret_function1.()
      |> secret_function2.()
    )
  end
end
