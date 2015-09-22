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
    unless @neighbours.nil?
      flag = true
      @neighbours.each {|n| flag = false if n.alive? }
      return flag
    end
		!@alive
	end

	def alive?
    unless @neighbours.nil?
      flag = false
      @neighbours.each {|n| flag = true if n.alive? }
      return flag
    end
		@alive
	end

	def next_generation neighbours
		# @neighbours = neighbours
    count = neighbours.inject(0){ |alive_count, n| n.alive? ? alive_count += 1 : alive_count }
    if count <= 3 && count > 2
      return GameOfLife::Cell.new
    else
      return GameOfLife::Cell.new(false)
    end
	end
end