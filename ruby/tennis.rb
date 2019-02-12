require 'rspec'

class TennisGame
  attr_reader :p_scores

  SCORE_MAP = [
    'Love',
    'Fifteen',
    'Thirty',
    'Forty'
  ]

  def initialize
    @p_scores = { 'player1' => 0, 'player2' => 0 }
  end

  def won_point(player)
    @p_scores[player] += 1
  end

  def score
    case
    when player1_win?
      'Win for player1'
    when player2_win?
      'Win for player2'
    when advantage_player1?
      'Advantage player1'
    when advantage_player2?
      'Advantage player2'
    when deuce?
      'Deuce'
    else
      "#{convert('player1')}-#{convert('player2')}"
    end
  end

  def convert(p)
    SCORE_MAP[@p_scores[p]]
  end

  def deuce?
    @p_scores['player1'] > 2 &&
      @p_scores['player2'] > 2 &&
      @p_scores['player1'] == @p_scores['player2']
  end

  def advantage_player1?
    @p_scores['player2'] > 3 &&
      @p_scores['player1'] > @p_scores['player2']
  end

  def advantage_player2?
    @p_scores['player1'] > 3 &&
      @p_scores['player2'] > @p_scores['player1']
  end

  def player1_win?
    @p_scores['player1'] > 3 &&
      (@p_scores['player1'] - @p_scores['player2']) > 1
  end

  def player2_win?
    @p_scores['player2'] > 3 &&
      (@p_scores['player2'] - @p_scores['player1']) > 1
  end
end

describe TennisGame do
  it 'Intial score' do
    expect('Love-Love').to eq(subject.score())
  end

  it 'Player 1 score once' do
    1.times { subject.won_point('player1') }

    expect('Fifteen-Love').to eq(subject.score())
  end

  it 'Player 1 score twice' do
    2.times { subject.won_point('player1') }

    expect('Thirty-Love').to eq(subject.score())
  end

  it 'Player 2 score once' do
    1.times { subject.won_point('player2') }

    expect('Love-Fifteen').to eq(subject.score())
  end

  it 'Player 1 score once and Player 2 score three times' do
    1.times { subject.won_point('player1') }
    3.times { subject.won_point('player2') }

    expect('Fifteen-Forty').to eq(subject.score())
  end

  it 'Player 1 and Player 2 both scores twice' do
    2.times { subject.won_point('player1') }
    2.times { subject.won_point('player2') }

    expect('Thirty-Thirty').to eq(subject.score())
  end

  it 'Player 1 and Player 2 both scores three times' do
    3.times { subject.won_point('player1') }
    3.times { subject.won_point('player2') }

    expect('Deuce').to eq(subject.score())
  end

  it 'Advantage Player 1' do
    5.times { subject.won_point('player1') }
    4.times { subject.won_point('player2') }

    expect('Advantage player1').to eq(subject.score())
  end

  it 'Advantage Player 2' do
    4.times { subject.won_point('player1') }
    5.times { subject.won_point('player2') }

    expect('Advantage player2').to eq(subject.score())
  end

  it 'Player 1 won' do
    4.times { subject.won_point('player1') }

    expect('Win for player1').to eq(subject.score())
  end

  it 'Player 1 won' do
    4.times { subject.won_point('player1') }
    2.times { subject.won_point('player2') }

    expect('Win for player1').to eq(subject.score())
  end

  it 'Player 2 won' do
    2.times { subject.won_point('player1') }
    4.times { subject.won_point('player2') }

    expect('Win for player2').to eq(subject.score())
  end
end
