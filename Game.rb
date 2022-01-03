require_relative "Player"

class Game

  def initialize
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @current_player = @player_1
    @turn = 1
    puts "New game intialized."
  end

  def play
    turn_message = "----- NEW TURN -----"
    game_over =  "----- GAME OVER -----"

    while (@player_1.lives != 0) && (@player_2.lives != 0)
      puts turn_message unless @turn == 1
      correct = ask()
      @current_player.lives -= 1 unless correct
      puts correct ? "YES! You are correct." : "Seriously? No!"
      puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3" unless @current_player.lives == 0
      switch_players()
      @turn +=1 
    end

    puts game_over
    puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3"

  end

  private

  def ask
    num_1 = rand(1...20)
    num_2 = rand(1...20)

    puts "#{@current_player.name}: What does #{num_1} plus #{num_2} equal?"
    answer = gets.chomp.to_i
    total = num_1 + num_2
    answer == total
  end

  def switch_players
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

end