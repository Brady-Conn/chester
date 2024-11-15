defmodule Chester.Engine do
  @moduledoc """
  Documentation for `Chester.Engine`, core engine functions for the chess engine.
  """
  # find all pieces that can move
    # play out all moves for each piece that can move
      # store each board state
      # store optimal move for each board state

  pieces = %{
    "pawn" => %{
                moves: %{
                    empty: [[0,1]],
                    capture: [[1,1], [-1, 1]],
                    special_capture: [[1,1], [-1, 1]],
                    special_move: [[0, 2]]
                    },
                starting_position: %{
                                      black: ["a7", "b7", "c7", "d7", "e7", "f7", "g7", "h7"],
                                      white: ["a2", "b2", "c2", "d2", "e2", "f2", "g2", "h2"],
                                    },
                },
    "horse" => %{
                  moves: %{
                      empty: [[1,3], [-1,3], [1, -3], [-1,-3]],
                      capture: [[1,3], [-1,3], [1, -3], [-1,-3]],
                      },
                  starting_position: %{
                                        white: ["b1", "g1"],
                                        black: ["b8", "g8"],
                                      }
                  },
    "bishop" => %{
                  moves: %{
                      empty: [[1,1], [-1,-1], [2,2], [-2,-2], [-3,-3], [3,-3], [4, 4], [-4, -4], [5, 5], [-5, -5], [6, 6], [-6, -6], [7, 7], [-7, -7], [8, 8], [-8, -8]],
                      capture: [[1,1], [-1,-1], [2,2], [-2,-2], [-3,-3], [3,-3], [4, 4], [-4, -4], [5, 5], [-5, -5], [6, 6], [-6, -6], [7, 7], [-7, -7], [8, 8], [-8, -8]],
                      },
                  starting_position: %{
                                        white: ["c1", "f1"],
                                        black: ["c8", "f8"],
                                      }
                  },
    "rook" => %{
                moves: %{
                  empty: [[0, 1], [0,2], [0,3], [0,4], [0,5], [0,6], [0,7], [0,8], [0, -1], [0,-2], [0,-3], [0,-4], [0,-5], [0,-6], [0,-7], [0,-8], [1,0], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0], [8,0], [-1,0], [-2,0], [-3,0], [-4,0], [-5,0], [-6,0], [-7,0], [-8,0]],
                  capture: [[0, 1], [0,2], [0,3], [0,4], [0,5], [0,6], [0,7], [0,8], [0, -1], [0,-2], [0,-3], [0,-4], [0,-5], [0,-6], [0,-7], [0,-8], [1,0], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0], [8,0], [-1,0], [-2,0], [-3,0], [-4,0], [-5,0], [-6,0], [-7,0], [-8,0]],
                  },
                starting_position: %{
                                      white: ["a1", "h1"],
                                      black: ["a8", "h8"],
                                    }
                },
    "queen" => %{
                moves: %{
                  empty: [[1,1], [-1,-1], [2,2], [-2,-2], [-3,-3], [3,-3], [4, 4], [-4, -4], [5, 5], [-5, -5], [6, 6], [-6, -6], [7, 7], [-7, -7], [8, 8], [-8, -8], [0, 1], [0,2], [0,3], [0,4], [0,5], [0,6], [0,7], [0,8], [0, -1], [0,-2], [0,-3], [0,-4], [0,-5], [0,-6], [0,-7], [0,-8], [1,0], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0], [8,0], [-1,0], [-2,0], [-3,0], [-4,0], [-5,0], [-6,0], [-7,0], [-8,0]],
                  capture: [[1,1], [-1,-1], [2,2], [-2,-2], [-3,-3], [3,-3], [4, 4], [-4, -4], [5, 5], [-5, -5], [6, 6], [-6, -6], [7, 7], [-7, -7], [8, 8], [-8, -8], [0, 1], [0,2], [0,3], [0,4], [0,5], [0,6], [0,7], [0,8], [0, -1], [0,-2], [0,-3], [0,-4], [0,-5], [0,-6], [0,-7], [0,-8], [1,0], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0], [8,0], [-1,0], [-2,0], [-3,0], [-4,0], [-5,0], [-6,0], [-7,0], [-8,0]],
                },
                starting_position: %{
                                      white: ["d1"],
                                      black: ["d8"],
                }
                },
    "king" => %{
                moves: %{
                empty: [[1,1], [-1,-1], [-1,0], [1,0], [0, 1], [-1, 1], [1, -1], [0, -1]]
                },
                starting_position: %{
                                      white: ["e1", "e8"],
                                      black: ["e8", "e1"],
                }
              }
  }

  # TODO: define board state struct

  starting_board = %{
    pieces: %{
          "wp1" => %{
            position: "a2",
            moves: [["a3", "a4"]]
          },
          "wp2" => %{
            position: "b2",
            moves: [["b3", "b4"]]
          },
          "wp3" => %{
            position: "c2",
            moves: [["c3", "c4"]]
          },
          "wp4" => %{
            position: "d2",
            moves: [["d3", "d4"]]
          },
          "wp5" => %{
            position: "e2",
            moves: [["e3", "e4"]]
          },
          "wp6" => %{
            position: "f2",
            moves: [["f3", "f4"]]
          },
          "wp7" => %{
            position: "g2",
            moves: [["g3", "g4"]]
          },
          "wp8" => %{
            position: "h2",
            moves: [["h3", "h4"]]
          },
          "bp1" => %{
            position: "a7",
            moves: [["a6", "a5"]]
          },
          "bp2" => %{
            position: "b7",
            moves: [["b6", "b5"]]
          },
          "bp3" => %{
            position: "c7",
            moves: [["c6", "c5"]]
          },
          "bp4" => %{
            position: "d7",
            moves: [["d6", "d5"]]
          },
          "bp5" => %{
            position: "e7",
            moves: [["e6", "e5"]]
          },
          "bp6" => %{
            position: "f7",
            moves: [["f6", "f5"]]
          },
          "bp7" => %{
            position: "g7",
            moves: [["g6", "g5"]]
          },
          "bp8" => %{
            position: "h7",
            moves: [["h6", "h5"]]
          },
          "wr1" => %{
            position: "a1",
            moves: []
          },
          "wh1" => %{
            position: "b1",
            moves: ["a3", "c3"]
          },
          "wb1" => %{
            position: "c1",
            moves: []
          },
          "wq1" => %{
            position: "d1",
            moves: []
          },
          "wk1" => %{
            position: "e1",
            moves: []
          },
          "wb2" => %{
            position: "f1",
            moves: []
          },
          "wh2" => %{
            position: "g1",
            moves: ["f3", "h3"]
          },
          "wr2" => %{
            position: "h1",
            moves: []
          },
          "br1" => %{
            position: "a8",
            moves: []
          },
          "bh1" => %{
            position: "b8",
            moves: ["a6", "c6"]
          },
          "bb1" => %{
            position: "c8",
            moves: []
          },
          "bq1" => %{
            position: "d8",
            moves: []
          },
          "bk1" => %{
            position: "e8",
            moves: []
          },
          "bb2" => %{
            position: "f8",
            moves: []
          },
          "bh2" => %{
            position: "g8",
            moves: ["f6", "h6"]
          },
          "br2" => %{
            position: "h8",
            moves: []
          }
    },
    turn: "white",
    checkmate: false,
    stalemate: false,
    winner: nil,
    white_time: 0,
    black_time: 0,
    total_time: 0,
    white_moves: 0,
    black_moves: 0,
    castling_available: false,
    en_passant_available: false,
  }

  def get_next_board_state(board_state, move) do
    # TODO: implement
  end

  def check_for_castling_availability(board_state) do
    # TODO: implement
  end

  def check_for_en_passant_availability(board_state) do
    # TODO: implement
  end

  def check_for_checkmate(board_state) do
    # TODO: implement
    board_state
  end

  def check_for_stalemate(board_state) do
    # TODO: implement
  end

  def check_for_check(board_state) do
      # TODO: implement
  end
end
