defmodule BamlPhx.BamlClient do
  use BamlElixir.Client, path: {:baml_phx, "priv/baml_src"}

  def ping do
    BamlPhx.BamlClient.Echo.stream(%{message: "Ping"}, &IO.inspect(&1))
  end
end
