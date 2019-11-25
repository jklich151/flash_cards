class Round
attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    Turn.new(guess, current_card)
  end

  def new_turn(guess)
    @new_turn = Turn.new(guess, current_card)
  end

  def turn(guess)
    turn = Turn.new(guess, current_card)
  end

  def correct
  if correct?
    "true"
    @turns << current_card.shift
  end
end

  def number_correct
    @turns.count
  end
end
