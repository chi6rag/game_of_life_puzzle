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

	def next_generation neighbours
    alive_neighbour_count = neighbours.inject(0){ |alive_count, n| n.alive? ? alive_count += 1 : alive_count }
    if self.alive?
      return GameOfLife::Cell.new if(alive_neighbour_count.between?(2,3))
    else
      return GameOfLife::Cell.new if alive_neighbour_count == 3
    end
    GameOfLife::Cell.new(false)
	end

end