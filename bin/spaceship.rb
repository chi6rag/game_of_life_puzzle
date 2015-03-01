#!/usr/bin/env ruby

$:.unshift(File.expand_path("../../lib", __FILE__))
require "game_of_life"

locations = [GameOfLife::Location.new(0, 1),
             GameOfLife::Location.new(1, 0),
             GameOfLife::Location.new(2, 0),
             GameOfLife::Location.new(2, 1),
             GameOfLife::Location.new(2, 2)]

generation = GameOfLife::Generation.with_live_cells_at(locations)

canvas = GameOfLife::StdOutCanvas.new

def output(generation, canvas, generation_number)
  canvas.declare_generation(generation_number)
  generation.draw(canvas)
  puts "\n"
end

output(generation, canvas, 0)

(1..5).each do |i|
  generation = generation.evolve
  output(generation, canvas, i)
  sleep(1)
end
