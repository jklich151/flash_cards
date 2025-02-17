require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

def test_it_has_a_card
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  assert_instance_of Card, turn.card
  assert_equal card, turn.card
end

def test_that_it_has_a_turn
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  assert_instance_of Turn, turn
end

def test_it_has_a_guess
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  assert_equal "Juneau", turn.guess

end

def test_it_is_correct
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  assert_equal true, turn.correct?

  turn = Turn.new("Denver", card)
  assert_equal false, turn.correct?
end

def test_has_feedback
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)
  require 'pry'; binding.pry
  assert_equal "Correct!", turn.feedback

  turn = Turn.new("Denver", card)
  assert_equal "Incorrect", turn.feedback
end
end
