require_relative "Player"

class Game
  attr_reader :player_1, :player_2
  attr_accessor :current_player, :turn

  def initialize
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @current_player = player_1
    @turn = 1
    puts "New game intialized."
  end

  def play
    turn_message = "----- NEW TURN -----"
    game_over =  "----- GAME OVER -----"

    while (player_1.lives != 0) && (player_2.lives != 0)
      puts turn_message unless turn == 1
      correct = ask_question()
      self.current_player.lives -= 1 unless correct
      puts correct ? "YES! You are correct." : "Seriously? No!"
      puts "P1: #{self.player_1.lives}/3 vs P2: #{self.player_2.lives}/3" unless self.current_player.lives == 0
      switch_players()
      self.turn += 1 
    end

    puts game_over
    puts "#{self.current_player.name} wins with a score of #{self.current_player.lives}/3"

  end

  private

  def ask_question
    num_1 = rand(1...20)
    num_2 = rand(1...20)

    puts "#{self.current_player.name}: What does #{num_1} plus #{num_2} equal?"
    answer = gets.chomp.to_i
    total = num_1 + num_2
    answer == total
  end

  def switch_players
    self.current_player = self.current_player == self.player_1 ? self.player_2 : self.player_1
  end

end