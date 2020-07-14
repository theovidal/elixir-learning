defmodule Weather do
  @moduledoc """
  Simple helper to fetch the weather from the OpenWeatherMap API.
  """

  @doc """
  Prepare the request by generating a URL using the passed parameters

  ## Examples

      iex> Weather.prepare_request("88e75a958fdsg8e6pm88es", "Paris,FR")
      'https://api.openweathermap.org/data/2.5/weather?APPID=88e75a958fdsg8e6pm88es&lang=en&q=Paris%2CFR&units=metric'

  """
  def prepare_request(key, location, lang \\ "en", units \\ "metric") do
    :inets.start
    :ssl.start

    url = "https://api.openweathermap.org/data/2.5/weather?"
    params = %{
      "APPID" => key,
      "q" => location,
      "lang" => lang,
      "units" => units
    }

    url <> URI.encode_query(params)
    |> to_charlist
  end

  @doc """
  Make a request using a generated OpenWeatherMap URL.
  """
  def make_request(url) do
    {:ok, {{_, code, _}, _, data}} = :httpc.request(url)

    return_request(code, data)
  end

  defp return_request(200, data) do
    {:ok, parsed} = Jason.decode(data)
    {:ok, parsed}
  end

  defp return_request(401, _) do
    {:error, "Invalid API key"}
  end

  defp return_request(404, _) do
    {:error, "Unknown location"}
  end
end
