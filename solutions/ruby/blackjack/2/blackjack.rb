module Blackjack
  def self.parse_card(card)
    case card
    when "ace" then 11
    when "ten", "jack", "queen", "king" then 10
    when "two" then 2
    when "three" then 3
    when "four" then 4
    when "five" then 5
    when "six" then 6
    when "seven" then 7
    when "eight" then 8
    when "nine" then 9
    else 0
    end
  end

  def self.card_range(card1, card2)
    total = [card1, card2].map {|card| parse_card(card)}.sum
    case total
    when 4..11 then "low"
    when 12..16 then "mid"
    when 17..20 then "high"
    when 21 then "blackjack"
    when 22 then "aces"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    case card_range(card1, card2)
    when "aces" then "P"
    when "blackjack"
      unless (10..11).include?(parse_card(dealer_card))
        "W"
      else
        "S"
      end
    when "high" then "S"
    when "mid"
      unless parse_card(dealer_card) >= 7
        "S"
      else
        "H"
      end
    else "H"
    end
  end
end
