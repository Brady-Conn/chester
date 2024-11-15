defmodule Chester.Board do
  use Ecto.Schema

  import Ecto.Changeset

  schema "boards" do
    has_many :pieces, Chester.Piece
    field :white_time, :integer
    field :black_time, :integer
    field :total_time, :integer
    field :white_moves, :integer
    field :black_moves, :integer
    field :castling_available, :boolean
    field :en_passant_available, :boolean
    field :turn, :string
    field :checkmate, :boolean
    field :stalemate, :boolean
    field :winner, :string
  end

  def changeset(board, attrs) do
    board
    |> cast(attrs, [:white_time, :black_time, :total_time, :white_moves, :black_moves, :castling_available, :en_passant_available, :turn, :checkmate, :stalemate, :winner])
    |> validate_required([:white_time, :black_time, :total_time, :white_moves, :black_moves, :castling_available, :en_passant_available, :turn, :checkmate, :stalemate, :winner])
  end

end
