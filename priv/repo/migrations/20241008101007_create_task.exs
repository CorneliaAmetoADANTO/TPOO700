defmodule ProjetTpoo700.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
  create table(:task) do
    add :title, :string
    add :description, :string 
    add :status, :string
    add :user_id, references(:user, on_delete: :delete_all)

    timestamps()
  end

  create index(:task, [:user_id])

  end
end
