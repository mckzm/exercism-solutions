defmodule DNA do
  @dna_to_bin %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }
  @bin_to_dna @dna_to_bin |> Enum.map(fn {k, v} -> {v, k} end) |> Map.new()

  @spec encode_nucleotide(integer()) :: integer()
  def encode_nucleotide(code_point), do: Map.fetch!(@dna_to_bin, code_point)

  @spec encode_nucleotide(integer()) :: integer()
  def decode_nucleotide(encoded_code), do: Map.fetch!(@bin_to_dna, encoded_code)

  @spec encode([integer()]) :: bitstring()
  def encode(dna), do: do_encode(dna, <<>>)

  @spec do_encode([integer()], bitstring()) :: bitstring()
  defp do_encode([], bitstr), do: bitstr

  defp do_encode([h | t], bitstr) do
    do_encode(t, <<bitstr::bitstring, encode_nucleotide(h)::size(4)>>)
  end

  @spec decode(bitstring()) :: [integer()]
  def decode(dna), do: do_decode(dna, ~c"")

  @spec do_decode(bitstring(), [integer()]) :: [integer()]
  defp do_decode(<<>>, charstr), do: charstr

  defp do_decode(<<h::size(4), t::bitstring>>, charstr) do
    do_decode(t, charstr ++ [decode_nucleotide(h)])
  end
end
