class Game_Logic
    # Initialize variables
    def initialize
        @player_1_lives = 3
        @player_2_lives = 3
        @is_over = false
    end

    # This method starts a game
    def play
        puts "Welcome to the math game!"
        puts "Each player has 3 lives."
        puts "Each player will alternate taking turns answering math questions."
        puts "The player that keeps their lives the longest wins!"
        puts "Good Luck!\n\n"
        initiate_turn
        check_winner
        game_over
    end

    #This method starts a turn
    def initiate_turn
        while !@is_over
            turn = Turn.new(@player_1_lives, @player_2_lives)
            @player_1_lives, @player_2_lives, @is_over = turn.start_turn
        end
    end

    # This method check to see which player won
    def check_winner
        if @player_1_lives > @player_2_lives
            congrats(1, @player_1_lives)
        else 
            congrats(2, @player_2_lives)
        end
    end

    # This method congratulates the winner
    def congrats(player, lives)
        puts "Congrats Player #{player}!  You win with a score of #{lives}/3!\n\n"
    end

    # This method prints the game over info
    def game_over
        puts "----- GAME OVER -----"
        puts "Thank you for playing, good bye!"
    end   
end