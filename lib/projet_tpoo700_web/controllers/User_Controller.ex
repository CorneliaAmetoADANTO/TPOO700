 defmodule ProjetTpoo700Web.UserController do
  use ProjetTpoo700Web, :controller
  alias ProjetTpoo700.Users.User
  alias ProjetTpoo700.Repo

  def index(conn, _params) do
    # liste des utilisateurs
    json(conn, %{user: ["first_name1", "first_name2"]})
  end

  def show(conn, %{"id" => id}) do
    # afficher un utilisateur
    json(conn, %{user: %{id: id, first_name: "User #{id}"}})
  end


  def create(conn, _params) do
    # créer un nouvel utilisateur
    json(conn, %{message: "User created"})
  end


  def update(conn, %{"id" => id}) do
    # mettre à jour un utilisateur
    json(conn, %{message: "User #{id} updated"})
  end

  def delete(conn, %{"id" => id}) do
    # supprimer un utilisateur
    json(conn, %{message: "User #{id} deleted"})
  end

end
