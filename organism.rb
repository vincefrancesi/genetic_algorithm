class Organism

  attr :genome
  attr_accessor :fitness

  def initialize(genome = nil)
    @genome = genome || random_genome
  end

  # Public: Mutate one character of the input genome
  #
  # Returns the new mutated genome as String.
  def mutation(genome)
    genome[rand(50)] = genome_map.sample
    genome[rand(50)] = genome_map.sample
    genome[rand(50)] = genome_map.sample
    genome[rand(50)] = genome_map.sample
    genome
  end

  # Public: Reproduce with another organism
  #
  # organism - instance of Organism class
  #
  # Returns new Organism instance
  def reproduce(organism)
    self.class.new(combine_genomes(self.genome, organism.genome))
  end

  # Public: Test against pattern
  #
  # pattern - Array of Strings
  #
  # Returns fitness Integer (lower is better)
  def test(pattern)
    amount_solved     = 0
    steps_to_solution = 0

    p = pattern.split('')

    genome.split('').each do |c|
      steps_to_solution += 1
      val = p[0]
      if val == c
        amount_solved += 1
        p.slice!(0)
        break if p.length == 0
      end
    end

    steps_to_solution - amount_solved
  end

  private

  # Private: Genome map
  #
  # Returns an Array of Strings
  def genome_map
    @genome_map ||= %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  end

  # Private: Random Genome
  #
  # Returns a String of a random genome
  def random_genome
    genome = ""
    (1..50).each do |i|
      genome += genome_map[rand(26)]
    end
    genome
  end

  # Private: Combine genomes
  #
  # Returns a new genome as String
  def combine_genomes(genome_a, genome_b)
    genome_a = genome_a.split('')
    genome_b = genome_b.split('')

    new_genome = ""
    50.times do |i|
      if rand(2) == 1
        new_genome += genome_a[i]
      else
        new_genome += genome_b[i]
      end
    end

    mutation(new_genome)
  end

end
