defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  import Identicon

  test "Hash input" do
    teste_hex = [
      105,
      141,
      193,
      157,
      72,
      156,
      78,
      77,
      183,
      62,
      40,
      167,
      19,
      234,
      176,
      123
    ]

    teste_grid = [
      {105, 0},
      {141, 1},
      {193, 2},
      {141, 3},
      {105, 4},
      {157, 5},
      {72, 6},
      {156, 7},
      {72, 8},
      {157, 9},
      {78, 10},
      {77, 11},
      {183, 12},
      {77, 13},
      {78, 14},
      {62, 15},
      {40, 16},
      {167, 17},
      {40, 18},
      {62, 19},
      {19, 20},
      {234, 21},
      {176, 22},
      {234, 23},
      {19, 24},
      {123, 25}
    ]

    "teste"
    |> hash_input
    |> assert_hex(teste_hex)
    |> pick_color
    |> assert_color({105, 141, 193})
    |> build_grid
    |> assert_grid(teste_grid)

    # |> filter_odd_squares
    # |> build_pixel_map
    # |> draw_image
    # |> save_image(input)
  end

  defp assert_hex(image, hex) do
    assert image.hex == hex
    image
  end

  defp assert_color(image, color) do
    assert image.color == color
    image
  end

  defp assert_grid(image, grid) do
    assert image.grid == grid
    image
  end

  test "identicon generate hash list" do
    image = Identicon.hash_input("test")

    assert length(image.hex) == 16
  end
end
