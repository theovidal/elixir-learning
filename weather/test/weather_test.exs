defmodule WeatherTest do
  use ExUnit.Case
  doctest Weather

  test "fetch the weather" do
    key = System.get_env("OPENWEATHERMAP_KEY")
    url = Weather.prepare_request(key, "Lyon,FR", "fr")
    {:ok, data} = Weather.make_request(url)

    assert data["name"] == "Lyon"
  end
end
