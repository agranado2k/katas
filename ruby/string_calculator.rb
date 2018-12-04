require 'rspec'

class StringCalculator
  def add(str)
    return str.split(',').map(&:to_i).reduce(0,:+)
  end
end


describe StringCalculator do
  it 'should return 0 for empty string' do
    expect(subject.add("")).to eq(0)
  end

  it 'should return 0 for string "0"' do
    expect(subject.add("0")).to eq(0)
  end

  it 'should return 1 for string "1"' do
    expect(subject.add("1")).to eq(1)
  end

  it 'should return 1 for string "0,1"' do
    expect(subject.add("0,1")).to eq(1)
  end

  it 'should return 2 for string "1,1"' do
    expect(subject.add("1,1")).to eq(2)
  end
end

