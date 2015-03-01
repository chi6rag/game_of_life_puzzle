require "spec_helper"

describe GameOfLife::StdOutCanvas do
  it "prints generation on standard output" do
    # Test through mocks
    canvas = GameOfLife::StdOutCanvas.new
    locations = [GameOfLife::Location.new(1, 0),
                 GameOfLife::Location.new(0, 1)]
    generation = GameOfLife::Generation.with_live_cells_at(locations)

    expect(canvas).to receive(:puts).once.ordered.with("From (0, 0) to (1, 1)")
    expect(canvas).to receive(:puts).once.ordered.with("| - | X |")
    expect(canvas).to receive(:puts).once.ordered.with("| X | - |")
    generation.draw(canvas)
  end
end
