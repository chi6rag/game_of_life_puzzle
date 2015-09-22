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
  				location.x -= 1
  				location.y += 1
  			elsif index == 2
  				location.x += 1
  				location.y -= 1
  			end
  			location
  		end
  	)
  end

  def draw(canvas, &block)
    
  end
end
