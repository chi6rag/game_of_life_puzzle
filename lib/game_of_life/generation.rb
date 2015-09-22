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
end
