class SetCards

  NUMBERS = [1, 2, 3].freeze
  COLOURS = [:red, :purple, :green].freeze
  FILLS = [:solid, :stripe, :empty].freeze
  SHAPES = [:diamond, :pill, :squiggle].freeze

  def self.create_cards
    NUMBERS.map do |number|
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
  end

  CARDS = create_cards.freeze

  def all_triples
    CARDS.combination(3).to_a
  end

  def valid_set?(combination)
    combination.map(&:values).transpose.select do |attribute|
      attribute.uniq.length == 2
    end.empty?
  end

  def count_valid_sets(all_selections)
    valid_sets(all_selections).count(true)
  end

  private

  def valid_sets(all_selections)
    all_selections.map do |selection|
      valid_set?(selection)
    end
  end
end
