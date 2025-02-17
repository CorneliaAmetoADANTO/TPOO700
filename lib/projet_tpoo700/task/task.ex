defmodule ProjetTpoo700.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :title, :string
    field :description, :string
    field :status, :string

    belongs_to :user, ProjetTpoo700.Users.User

    timestamps()
  end

  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :status, :user_id])
    |> validate_required([:title, :status, :user_id])
  end
end