class GameOfLife::Location
	attr_accessor :x, :y

  def initialize(x=0,y=0)
  	@x = x
  	@y = y
  end

  def ==(other)
  	return false unless other.is_a? GameOfLife::Location
  	self.x == other.x && self.y == other.y
  end
  alias_method :eql?, :==

end
