class Turn
    # Initialize variables
    def initialize(p1_lives, p2_lives)
        @current_player = 1
        @player_1_lives = p1_lives
        @player_2_lives = p2_lives
        @is_over = false
    end
    
    # This method handles each turn
    def start_turn
        while @current_player <= 2 && !@is_over
            puts "----- NEW TURN -----"
            question = Question.new(@current_player)
            if !question.new_question
                if @current_player == 1
                    @player_1_lives -= 1
                else
                    @player_2_lives -= 1
                end
            end
            puts "P1: #{@player_1_lives}/3 vs P2: #{@player_2_lives}/3\n\n"
            check_game_over
            @current_player += 1
        end
        return @player_1_lives, @player_2_lives, @is_over
    end

    # Checks to see if either of the players lives are less than or equal to 0
    def check_game_over
        if @player_1_lives == 0 || @player_2_lives == 0
            @is_over = true
        end
    end
end