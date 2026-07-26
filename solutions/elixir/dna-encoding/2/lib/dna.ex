defmodule DNA do
  @dna_to_bin %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }
  @bin_to_dna @dna_to_bin |> Enum.map(fn {k, v} -> {v, k} end) |> Map.new()

  def encode_nucleotide(code_point) do
    @dna_to_bin[code_point]
  end

  def decode_nucleotide(encoded_code) do
    @bin_to_dna[encoded_code]
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  defp do_encode([], bitstr), do: bitstr

  defp do_encode([h | t], bitstr) do
    do_encode(t, <<bitstr::bitstring, encode_nucleotide(h)::size(4)>>)
  end

  def decode(dna) do
    do_decode(dna, [])
  end

  defp do_decode(<<>>, chars), do: chars |> Enum.reverse()

  defp do_decode(<<h::size(4), t::bitstring>>, chars) do
    do_decode(t, [decode_nucleotide(h) | chars])
  end
end
