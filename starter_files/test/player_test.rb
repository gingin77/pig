require "minitest/autorun"
require "player"

class PlayerTest < Minitest::Test
  ObjectSpace.each_object(Player.singleton_class).each do |klass|
    define_method("test_starting_score_#{klass}") do
      assert_equal 0, klass.new("Test").score
    end

    define_method("test_always_roll_again_at_turn_start_#{klass}") do
      player = klass.new("Test")
      player.start_game
      player.start_turn
      assert player.roll_again?
    end

    define_method("test_adds_score_correctly_#{klass}") do
      player = klass.new("Test")
      player.start_game
      player.start_turn

      player.record_roll(3)
      player.record_roll(4)
      player.end_turn

      assert_equal 7, player.score
    end

    define_method("test_adds_score_correctly_when_1_is_rolled_#{klass}") do
      player = klass.new("Test")
      player.start_game
      player.start_turn

      player.record_roll(3)
      player.record_roll(4)
      player.record_roll(1)
      player.end_turn

      assert_equal 0, player.score
    end


    define_method("test_roll_again_after_roll_of_1_#{klass}") do
      player = klass.new("Test")
      player.start_game
      player.start_turn

      player.record_roll(1)
      refute player.roll_again?
    end
  end
end
