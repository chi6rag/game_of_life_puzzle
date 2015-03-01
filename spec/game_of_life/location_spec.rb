require "spec_helper"

describe GameOfLife::Location do
  context "adjacent locations" do

    it "has 8 adjacent locations" do
      x = 0
      y = 1
      location = GameOfLife::Location.new(x, y)

      expected_locations = (-1..1).inject([]) do |col, x_delta|
        (-1..1).inject(col) do |col, y_delta|
          col << GameOfLife::Location.new(x - x_delta, y - y_delta) unless [x_delta, y_delta] == [0, 0]
          col
        end
      end

      adjacent_locations = location.adjacent

      expect(adjacent_locations.count).to eq(8)
      expect(adjacent_locations).to match_array(expected_locations)
    end
  end

  context "equality" do
    let(:location) { GameOfLife::Location.new(1, 2) }
    it "is equal to itself" do
      expect(location).to eq(location)
    end

    it "is equal if both x and y coordinates are same" do
      expect(location).to eq(GameOfLife::Location.new(1, 2))
    end

    it "is not equal to a random object" do
      expect(location).to_not eq(Object.new)
    end

    it "is not equal if x coordinate is different" do
      expect(location).to_not eq(GameOfLife::Location.new(2, 2))
    end

    it "is not equal if y coordinate is different" do
      expect(location).to_not eq(GameOfLife::Location.new(1, 1))
    end
  end
end
