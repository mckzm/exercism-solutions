defmodule PaintByNumber do
  def palette_bit_size(color_count), do: get_power_of_two(color_count, 0)

  defp get_power_of_two(count, pow) do
    if count > 2 ** pow, do: get_power_of_two(count, pow + 1), else: pow
  end

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0b00::2, 0b01::2, 0b10::2, 0b11::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    width = palette_bit_size(color_count)
    pixel = <<pixel_color_index::size(width)>>
    <<pixel::bitstring, picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    get_or_drop_first_pixel(picture, color_count, :get)
  end

  def drop_first_pixel(picture, color_count) do
    get_or_drop_first_pixel(picture, color_count, :drop)
  end

  defp get_or_drop_first_pixel(<<>>, _color_count, :get), do: nil
  defp get_or_drop_first_pixel(<<>>, _color_count, :drop), do: <<>>
  defp get_or_drop_first_pixel(picture, color_count, get_or_drop) do
    width = palette_bit_size(color_count)
    <<first_pixel::size(^width), rest::bitstring>> = picture
    case get_or_drop do
      :get -> first_pixel
      :drop -> rest
    end
  end

  def concat_pictures(<<>>, <<>>), do: <<>>
  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
