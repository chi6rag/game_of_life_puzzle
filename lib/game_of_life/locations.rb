class GameOfLife::Locations

  def initialize(locations)
    @locations = locations
  end

  # lost implementation
  def with_adjacent_locations
  	(0..2).inject([]) do |col, x|
      (0..3).inject(col) do |col, y|
        col << GameOfLife::Location.new(x, y)
      end
    end
  end

  def lower_bound
  	return nil if @locations.empty?
  	lowest_x = (@locations[0]).x
  	lowest_y = (@locations[0]).y
  	@locations.each do |location|
  		lowest_x = location.x if location.x < lowest_x
  		lowest_y = location.y if location.y < lowest_y
  	end
  	GameOfLife::Location.new(lowest_x, lowest_y)
  end

  def upper_bound
  	return nil if @locations.empty?
  	upper_x = (@locations[0]).x
  	upper_y = (@locations[0]).y
  	@locations.each do |location|
  		upper_x = location.x if location.x > upper_x
  		upper_y = location.y if location.y > upper_y
  	end
  	GameOfLife::Location.new(upper_x, upper_y)
  end

end
