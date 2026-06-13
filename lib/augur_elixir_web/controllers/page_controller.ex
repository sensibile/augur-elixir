defmodule AugurElixirWeb.PageController do
  use AugurElixirWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
