defmodule Chester.Engine do
  @moduledoc """
  Documentation for `Chester.Engine`, plugin to run stockfish engine.
  """
  def start_link(_opts) do
    Port.open({:spawn_executable, "stockfish"}, [:binary])
  end

  def child_spec(opts) do
    # TODO: implement
    %{
      id: Chester.Engine,
      start: {Chester.Engine, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 5000,
    }
  end
end
