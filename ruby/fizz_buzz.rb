require 'rspec'

class FizzBuzz
  def generate_list(num)
    result = []

    1.upto(num) do |i|
      if i % 3 == 0 and i % 5 == 0
        i = 'fizzbuzz'
      elsif i % 3 == 0
        i = 'fizz'
      elsif i % 5 == 0
        i = 'buzz'
      end

      result.push(i)
    end

    return result
  end

end

describe FizzBuzz do
  it 'generate list until 2' do
    expected_list = [1, 2]

    expect(subject.generate_list(2)).to eq(expected_list)

  end

  it 'generate list until 3 with "fizz"' do
    expected_list = [1, 2, 'fizz']

    expect(subject.generate_list(3)).to eq(expected_list)
  end

  it 'generate list until 5 with "fizz" and "buzz"' do
    expected_list = [1, 2, 'fizz', 4, 'buzz']

    expect(subject.generate_list(5)).to eq(expected_list)
  end

  it 'generate number list with fizz and buzz for num divisiable for 3 or 5' do
    expected_list = [1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz']

    expect(subject.generate_list(10)).to eq(expected_list)
  end

  it 'generate number list with fizz and buzz for num divisiable 3 or 5, and fizzbuzz for divisable for 3 and 5' do
    expected_list = [1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz', 11, 'fizz', 13, 14, 'fizzbuzz']

    expect(subject.generate_list(15)).to eq(expected_list)
  end
end


