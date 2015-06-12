require 'set_cards'

describe SetCards do

  it 'generates all possible combinations of 3 cards' do
    expect(subject.all_triples.length).to eq 85320
  end

  it 'does not validate a combination that has two cards with the same attribute' do
    combination = [
      {:number=>2, :colour=>:red, :fill=>:solid, :shape=>:pill},
      {:number=>2, :colour=>:purple, :fill=>:solid, :shape=>:squiggle},
      {:number=>3, :colour=>:green, :fill=>:stripe, :shape=>:pill}
    ]
    expect(subject.valid_set?(combination)).to be_falsey
  end

  it 'validates a combination of all distinct cards' do
    combination = [
      {:number=>1, :colour=>:red, :fill=>:solid, :shape=>:pill},
      {:number=>2, :colour=>:purple, :fill=>:empty, :shape=>:squiggle},
      {:number=>3, :colour=>:green, :fill=>:stripe, :shape=>:diamond}
    ]
    expect(subject.valid_set?(combination)).to be_truthy
  end

  it 'validates a combination of cards with a single shared attribute' do
    combination = [
      {:number=>1, :colour=>:red, :fill=>:solid, :shape=>:pill},
      {:number=>1, :colour=>:purple, :fill=>:empty, :shape=>:squiggle},
      {:number=>1, :colour=>:green, :fill=>:stripe, :shape=>:diamond}
    ]
    expect(subject.valid_set?(combination)).to be_truthy
  end

  it 'validates a combination of cards with a two shared attribute' do
    combination = [
      {:number=>1, :colour=>:red, :fill=>:solid, :shape=>:pill},
      {:number=>1, :colour=>:red, :fill=>:empty, :shape=>:squiggle},
      {:number=>1, :colour=>:red, :fill=>:stripe, :shape=>:diamond}
    ]
    expect(subject.valid_set?(combination)).to be_truthy
  end

  it 'finds all valid sets' do
    expect(subject.count_valid_sets(subject.all_triples)).to eq 1080
  end
end
