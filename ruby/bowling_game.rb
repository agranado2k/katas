require 'rspec'

class BowlingGame
  def line(string)
    score = 0
    string.split(//).each_with_index do |r, index|
      r = 10 if r == 'X'
      r = num = r.to_i
      r += num if index > 0 && string[index - 1] == 'X'
      r += num if index > 1 && string[index - 2] == 'X'
      score += r
    end
    score
  end

end

describe BowlingGame do
  it { expect(true).to be_truthy }

  it '0 score for 0 pins hit' do
    input = '0000000000'

    expect(subject.line(input)).to eq(0)
  end

  it 'score X for some hit pins' do
    input = '12345123451234512345'

    expect(subject.line(input)).to eq(60)
  end

  it '12 score for one strike + 1 pin' do
    input = 'X100000000'

    expect(subject.line(input)).to eq(12)
  end

  it '14 score for one strike + 1 pin + 1 pin' do
    input = 'X110000000'

    expect(subject.line(input)).to eq(14)
  end

  it 'score Max for all strikes' do
    input = 'XXXXXXXXXXXX'

    expect(subject.line(input)).to eq(300)
  end
end
