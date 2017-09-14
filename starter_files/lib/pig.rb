class Pig
  def initialize(*players, games: 1, silent: false)
    @players = players
    @games = games
    @silent = silent
  end

  def log(player, message)
    puts "#{player.name} #{message}" unless @silent
  end

  def roll_die
    rand(6) + 1
  end

  def run
    @games.times do
      run_game
    end

    @players.each do |player|
      puts "#{player.name} won #{player.wins} game(s) and lost #{player.losses} game(s)."
    end
  end

  def run_game
    @players.shuffle!

    @players.each do |player|
      player.start_game
    end

    @players.cycle.each do |player|
      player.start_turn

      while player.roll_again?
        roll = roll_die
        if roll == 1
          log(player, "rolls a 1 and loses their turn.")
        else
          log(player, "rolls a #{roll}.")
        end
        player.record_roll(roll)
      end

      log(player, "ends their turn with a score of #{player.score}.")
      player.end_turn

      if player.score >= 100
        log(player, "has won!")
        break
      end
    end

    @players.each do |player|
      player.end_game
    end
  end
end
