require_relative "Player"

class Game

  def initialize
    @player_1 = Player.new
    @player_2 = Player.new
    @current_player = @player_1
    puts "New game intialized."
  end

  def play

    while (@player_1.lives != 0) && (@player_2.lives != 0)
      correct = ask()
      @current_player.lives -= 1 unless correct
    end

  end

  private

  def ask
    num_1 = rand(1...20)
    num_2 = rand(1...20)
    puts "What does #{num_1} plus #{num_2} equal?"
    answer = gets.chomp
    answer == num_1 + num_2
  end

end