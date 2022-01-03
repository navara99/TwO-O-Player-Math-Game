require_relative "Player"

class Game

  def initialize
    @player_1 = Player.new
    @player_2 = Player.new
    @current_player = @player_1
    puts "New game intialized. Call the play method to start playing."
  end

  def play

    ask()
    # while @player_1.lives && @player_2.lives
    #   answer = gets.chomp
    # end

  end

  private

  def ask
    
  end

end