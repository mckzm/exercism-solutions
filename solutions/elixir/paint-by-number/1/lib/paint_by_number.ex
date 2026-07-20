defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    get_power_of_two(color_count, 0)
  end

  def get_power_of_two(count, pow) do
    if count > 2 ** pow do
      get_power_of_two(count, pow + 1)
    else
      pow
    end
  end

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0b00::2, 0b01::2, 0b10::2, 0b11::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    width = palette_bit_size(color_count)
    pixel = <<pixel_color_index::size(width)>>
    <<pixel::bitstring, picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count), do: nil
  def get_first_pixel(picture, color_count) do
    width = palette_bit_size(color_count)
    <<first_pixel::size(^width), _rest::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(<<>>, _color_count), do: <<>>
  def drop_first_pixel(picture, color_count) do
    width = palette_bit_size(color_count)
    <<_first_pixel::size(^width), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(<<>>, <<>>), do: <<>>
  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
