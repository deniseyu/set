class SetCards

  NUMBERS = [1, 2, 3]
  COLOURS = [:red, :purple, :green]
  FILLS = [:solid, :stripe, :empty]
  SHAPES = [:diamond, :pill, :squiggle]

  CARDS = NUMBERS.map do |number|
    COLOURS.map do |colour|
      FILLS.map do |fill|
        SHAPES.map do |shape|
          {
            number: number,
            colour: colour,
            fill: fill,
            shape: shape
          }
        end
      end
    end
  end.flatten(3)

  def all_triples
    CARDS.combination(3).to_a
  end

  def valid_sets?(combination)
    combination.map(&:values).transpose.select do |attribute|
      attribute.uniq.length == 2
    end.empty?
  end

  def count_valid_sets(all_selections)
    all_selections.map do |selection|
      valid_sets?(selection)
    end.count(true)
  end
end
