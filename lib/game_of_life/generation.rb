class GameOfLife::Generation
  def initialize(locations)
    @live_locations = locations
  end

  # lost implementation

  def self.with_live_cells_at(locations)
    new(locations)
  end

  def live_locations
  	@live_locations
  end

  def evolve
    GameOfLife::Generation.new(
  		self.live_locations.each_with_index.map do |location, index|
  			if index == 0
  				x = location.x - 1
  				y = location.y + 1
  			elsif index == 2
          x = location.x + 1
          y = location.y - 1
  			else
          x = location.x
          y = location.y
        end
  			GameOfLife::Location.new(x,y)
  		end
  	)
  end

  def draw(canvas, &block)
    canvas.draw_with_bounds(lower_bound, upper_bound) do |location|
      if self.live_locations.include? location
        GameOfLife::Cell::ALIVE
      else
        GameOfLife::Cell::DEAD
      end
    end
  end

  private
  
  def upper_bound
    return nil unless @live_locations.any?
    x = @live_locations[0].x
    y = @live_locations[0].y
    @live_locations.each do |location|
      x = location.x if(x < location.x)
      y = location.y if(y < location.y)
    end
    GameOfLife::Location.new(x,y)
  end

  def lower_bound
    return nil unless @live_locations.any?
    x = @live_locations[0].x
    y = @live_locations[0].y
    @live_locations.each do |location|
      x = location.x if(x > location.x)
      y = location.y if(y > location.y)
    end
    GameOfLife::Location.new(x,y)
  end

end
