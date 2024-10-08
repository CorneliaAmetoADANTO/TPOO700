defmodule ProjetTpoo700Web.TaskController do
  use ProjetTpoo700Web, :controller

  def index(conn, _params) do
    # liste des tâches
    json(conn, %{task: ["title1", "title2"]})
  end

  def show(conn, %{"id" => id}) do
    # afficher une tâche spécifique
    json(conn, %{task: %{id: id, title: "Task #{id}"}})
  end

  def create(conn, _params) do
    # créer une nouvelle tâche
    json(conn, %{message: "Task created"})
  end

  def update(conn, %{"id" => id}) do
    # mettre à jour une tâche
    json(conn, %{message: "Task #{id} updated"})
  end

  def delete(conn, %{"id" => id}) do
    # supprimer une tâche
    json(conn, %{message: "Task #{id} deleted"})
  end
end