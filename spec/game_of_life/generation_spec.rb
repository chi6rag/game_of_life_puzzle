require "spec_helper"

describe GameOfLife::Generation do
  context "initiate" do
    it "can be initialized with list of locations with live cells" do
      locations = [GameOfLife::Location.new(1, 1),
                   GameOfLife::Location.new(5, 3),
                   GameOfLife::Location.new(-2, 10)]
      generation = GameOfLife::Generation.with_live_cells_at(locations)
      expect(generation.live_locations).to match_array(locations)
    end

    it "all non live cells are dead" do
      locations = [GameOfLife::Location.new(1, 1),
                   GameOfLife::Location.new(5, 3),
                   GameOfLife::Location.new(-2, 10)]
      generation = GameOfLife::Generation.with_live_cells_at(locations)
      expect(generation.live_locations).to_not include(GameOfLife::Location.new(2, 3))
    end
  end

  context "evolve" do
    it "can evolve to next generation (oscillator)" do
      locations = [GameOfLife::Location.new(0, 1),
                   GameOfLife::Location.new(0, 2),
                   GameOfLife::Location.new(0, 3)]
      current_generation = GameOfLife::Generation.with_live_cells_at(locations)
      next_generation = current_generation.evolve


      expect(next_generation.live_locations).to include(GameOfLife::Location.new(-1,2),
                                                        GameOfLife::Location.new(0,2),
                                                        GameOfLife::Location.new(1,2))
      expect(next_generation.live_locations).to_not include(GameOfLife::Location.new(0,1),
                                                            GameOfLife::Location.new(0,3),
                                                            GameOfLife::Location.new(-1,1))
    end
  end

  context "draw" do
    it "calls the canvas with bounding locations and a block which returns status of the cell at any location" do
      # Test through mocks
      locations = [GameOfLife::Location.new(-2, 3),
                   GameOfLife::Location.new(5, 8),
                   GameOfLife::Location.new(7, -10)]
      generation = GameOfLife::Generation.with_live_cells_at(locations)

      canvas = double("canvas")

      expect(canvas).to receive(:draw_with_bounds).
      with(GameOfLife::Location.new(-2, -10), GameOfLife::Location.new(7, 8)) do |&block|
        expect(block.call(GameOfLife::Location.new(-2, 3))).to eq(GameOfLife::Cell::ALIVE)
        expect(block.call(GameOfLife::Location.new(1, 1))).to eq(GameOfLife::Cell::DEAD)
      end
      generation.draw(canvas)
    end
  end
end
