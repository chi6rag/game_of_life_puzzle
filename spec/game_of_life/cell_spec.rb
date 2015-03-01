require 'spec_helper'

describe GameOfLife::Cell do
  def build_neighbours(live_count)
    [GameOfLife::Cell.new_live_cell] * live_count +
      [GameOfLife::Cell.new_dead_cell] * (8 - live_count)
  end
  context "factory" do
    it "can be dead" do
      expect(GameOfLife::Cell.new_dead_cell).to be_dead
    end

    it "can be alive" do
      expect(GameOfLife::Cell.new_live_cell).to be_alive
    end
  end

  context "live cell generation rules" do
    let(:cell) { GameOfLife::Cell.new_live_cell }

    [0, 1].each do |i|
      it "dies when there are #{i} live neighbours" do
        expect(cell.next_generation(build_neighbours(i))).to be_dead
      end
    end

    [2, 3].each do |i|
      it "lives when there are #{i} live neighbours" do
        expect(cell.next_generation(build_neighbours(i))).to be_alive
      end
    end

    (4..8).each do |i|
      it "dead when there are #{i} live neighbours" do
        expect(cell.next_generation(build_neighbours(i))).to be_dead
      end
    end
  end

  context "dead cell generation rules" do
    let(:cell) { GameOfLife::Cell.new_dead_cell }

    (0..2).each do |i|
      it "dies when there are #{i} live neighbours" do
        expect(cell.next_generation(build_neighbours(i))).to be_dead
      end
    end

    [3].each do |i|
      it "lives when there are #{i} live neighbours" do
        expect(cell.next_generation(build_neighbours(i))).to be_alive
      end
    end

    (4..8).each do |i|
      it "dead when there are #{i} live neighbours" do
        expect(cell.next_generation(build_neighbours(i))).to be_dead
      end
    end
  end
end
