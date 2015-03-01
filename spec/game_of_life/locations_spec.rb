require "spec_helper"

describe GameOfLife::Locations do
  it "can determine adjacent locations" do
    locations = GameOfLife::Locations.new([GameOfLife::Location.new(1, 1),
                                           GameOfLife::Location.new(1, 2)])
    expected_locations = (0..2).inject([]) do |col, x|
      (0..3).inject(col) do |col, y|
        col << GameOfLife::Location.new(x, y)
      end
    end
    expect(locations.with_adjacent_locations).to match_array(expected_locations)
  end

  it "can determine lower bound of the range" do
    locations = GameOfLife::Locations.new([GameOfLife::Location.new(-1, 3),
                                           GameOfLife::Location.new(1, 10),
                                           GameOfLife::Location.new(5, 2)])
    expect(locations.lower_bound).to eq(GameOfLife::Location.new(-1, 2))
  end

  it "can determine upper bound of the range" do
    locations = GameOfLife::Locations.new([GameOfLife::Location.new(-1, 3),
                                           GameOfLife::Location.new(1, 10),
                                           GameOfLife::Location.new(5, 2)])
    expect(locations.upper_bound).to eq(GameOfLife::Location.new(5, 10))
  end
end
