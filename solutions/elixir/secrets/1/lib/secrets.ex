defmodule Secrets do
  def secret_add(secret) do
    fn i -> i + secret end
  end

  def secret_subtract(secret) do
    fn i -> i - secret end
  end

  def secret_multiply(secret) do
    fn i -> secret * i end
  end

  def secret_divide(secret) do
    fn i -> div(i, secret) end
  end

  def secret_and(secret) do
    fn i -> Bitwise.band(i, secret) end
  end

  def secret_xor(secret) do
    fn i -> Bitwise.bxor(i, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn secret -> secret_function2.(secret_function1.(secret)) end
  end
end
