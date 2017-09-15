require "pry"

class Player
  attr_reader :score, :name, :wins, :losses

  def initialize(name)
    @name = name
    @score = 0
    @wins = 0
    @losses = 0
  end

  def start_game
    @score = 0
  end

  def start_turn
    @turn_score = 0
    @turn_over = false
  end

  def record_roll(roll)
    if roll == 1
      @turn_score = 0
      @turn_over = true
    else
      @turn_score += roll
    end
  end

  def end_turn
    @score += @turn_score
  end

  def end_game
    if score >= 100
      @wins += 1
    else
      @losses += 1
    end
  end

  def roll_again?
    !@turn_over
  end
end

class CautiousPlayer < Player
  def roll_again?
    super && @turn_score < 5
  end
end

class StopatThreeRollsPlayer < Player
  def start_turn
    super
    @rolls = 0
  end
  def record_roll(roll)
    super
    @rolls += 1
  end
  def roll_again?
    super && @rolls < 3
  end
end

# a player that stops when they get a particular score for a turn
class StopatScorePlayer < Player
  def start_turn
    super
    @rolls = 0
  end
  def record_roll(roll)
    super
    @rolls += 1
  end
  def roll_again?
    super && @turn_score < 18
  end
end

# a player that changes strategies based on their current total score
class StrategyChangerPlayer < Player
  def start_turn
    super
    @rolls = 0
  end
  def record_roll(roll)
    super
    @rolls += 1
  end
  def roll_again?
    super && !stop?
  end
  def stop?
    (@rolls == 2 && @turn_score >= 12) || @turn_score >= 20
  end
end
