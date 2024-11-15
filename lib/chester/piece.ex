defmodule Chester.Piece do
  use Ecto.Schema

  import Ecto.Changeset

  schema "pieces" do
    field :name, :string
    field :position, :string
    field :move, :string
    belongs_to :board, Chester.Board
  end

  def changeset(piece, attrs) do
    piece
    |> cast(attrs, [:position, :move])
    |> validate_required([:position, :move])
  end
end
