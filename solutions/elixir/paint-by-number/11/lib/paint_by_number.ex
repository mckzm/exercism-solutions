defmodule PaintByNumber do
  @spec palette_bit_size(integer()) :: integer()
  def palette_bit_size(color_count), do: get_power_of_two(color_count, 0)

  @spec get_power_of_two(integer(), integer()) :: integer()
  defp get_power_of_two(count, pow) do
    if count > 2 ** pow, do: get_power_of_two(count, pow + 1), else: pow
  end

  @spec empty_picture() :: <<>>
  def empty_picture(), do: <<>>

  @spec test_picture() :: bitstring()
  def test_picture(), do: <<0b00::2, 0b01::2, 0b10::2, 0b11::2>>

  @spec prepend_pixel(bitstring(), integer(), integer()) :: bitstring()
  def prepend_pixel(picture, color_count, pixel_color_index) do
    width = palette_bit_size(color_count)
    pixel = <<pixel_color_index::size(width)>>
    <<pixel::bitstring, picture::bitstring>>
  end

  @spec get_first_pixel(bitstring(), integer()) :: nil | bitstring()
  def get_first_pixel(<<>>, _color_count), do: nil

  def get_first_pixel(picture, color_count) do
    {first_pixel, _rest} = uncons(picture, color_count)
    first_pixel
  end

  @spec drop_first_pixel(bitstring(), integer()) :: bitstring()
  def drop_first_pixel(<<>>, _color_count), do: empty_picture()

  def drop_first_pixel(picture, color_count) do
    {_first_pixel, rest} = uncons(picture, color_count)
    rest
  end

  @spec uncons(bitstring(), integer()) :: {integer(), bitstring()}
  defp uncons(picture, color_count) do
    width = palette_bit_size(color_count)
    <<first_pixel::size(^width), rest::bitstring>> = picture
    {first_pixel, rest}
  end

  @spec concat_pictures(bitstring(), bitstring()) :: bitstring()
  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
