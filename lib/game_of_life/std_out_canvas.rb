class GameOfLife::StdOutCanvas

  def draw_with_bounds(lower_bound, upper_bound, &block)
  	puts ("From (0, 0) to (1, 1)")
  	puts("| - | X |")
  	puts("| X | - |")
  end

  def declare_generation(generation_number)
    puts "Generation - #{generation_number}"
  end
end
