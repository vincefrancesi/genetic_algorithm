require './organism'

GENERATIONS = 1000
POPULATION  = 50
TEST        = "ABCD"

fittest = []

puts "Generation, Fittest 0, Fittest 1"
GENERATIONS.times do |i|
  population = []

  POPULATION.times do
    if fittest.size > 0
      population << fittest[0].reproduce(fittest[1])
    else
      population << Organism.new
    end
  end

  population = population.sort_by { |o| o.test(TEST) }

  fittest = [population[0], population[1]]

  # CSV output for graphing
  puts "#{i},#{fittest[0].test(TEST)},#{fittest[1].test(TEST)}"

  break if fittest[0].test(TEST) == 0
end

puts "Resulting genomes:"
puts fittest[0].genome
puts fittest[1].genome
