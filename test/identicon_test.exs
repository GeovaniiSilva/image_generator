defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "identicon generate hash list" do

    image = Identicon.hash_input("test")
    assert length(image.hex) == 16
  end

end
