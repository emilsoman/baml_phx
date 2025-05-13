defmodule BamlPhx.BamlClient do
  use BamlElixir.Client, path: Application.app_dir(:baml_phx, "priv/baml_src")

  def ping do
    BamlPhx.BamlClient.Echo.stream(%{message: "Ping"}, &IO.inspect(&1))
  end
end
