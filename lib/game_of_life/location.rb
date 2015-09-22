class GameOfLife::Location
	attr_accessor :x, :y

  def initialize(x,y)
  	@x = x
  	@y = y
  end

  def ==(other)
  	return false unless other.is_a? GameOfLife::Location
  	self.x == other.x && self.y == other.y
  end
  alias_method :eql?, :==

  def adjacent
    adjacent_locations = (-1..1).inject([]) do |locations, x_delta|
      (-1..1).inject(locations) do |locations, y_delta|
        locations << GameOfLife::Location.new(self.x - x_delta, self.y - y_delta) unless [x_delta, y_delta] == [0, 0]
        locations
      end
    end
    adjacent_locations
  end

end
