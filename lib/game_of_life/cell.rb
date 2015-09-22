class GameOfLife::Cell
  ALIVE = "alive"
  DEAD = "dead"

  def initialize(alive=true)
  	@alive = alive
  end

  # lost implementation
  def self.new_dead_cell
  	self.new(false)
  end

  def self.new_live_cell
  	self.new
	end

	def dead?
		!@alive
	end

	def alive?
		@alive
	end
end
