defmodule ProjetTpoo700Web.ErrorJSONTest do
  use ProjetTpoo700Web.ConnCase, async: true

  test "renders 404" do
    assert ProjetTpoo700Web.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert ProjetTpoo700Web.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
