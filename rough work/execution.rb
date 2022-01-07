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

class Question
    # Initialize variables
    def initialize(player)
        @answer = false
        @player = player
        @user_input = ""
        @response = 0
        @question = ""
    end

    # This method asks a new question and checks the answer
    def new_question
        get_random_question
        puts "Player #{@player}: #{@question}"
        get_user_response
        check_answer
        return @answer
    end

    # This method generates a random question
    def get_random_question
        operands = ["+", "-", "*"]
        first_number = rand(100)
        second_number = rand(100)
        selected_operand = operands[rand(operands.size)]
        if selected_operand == "+"
            @response = first_number + second_number
        elsif selected_operand == "-"
            @response = first_number - second_number
        else
            @response = first_number * second_number
        end
        @question = "What does #{first_number} #{get_operand_text(selected_operand)} #{second_number} equal?"
    end

    # This method gets the text for the specific operand that is passed into it
    def get_operand_text(operand)
        if operand == "+"
            return "plus"
        elsif operand == "-"
            return "minus"
        else
            return "times"
        end
    end
    
    # This method gets the users input
    def get_user_response
        print "> "
        @user_input = $stdin.gets.chomp
    end

    # This method checks the users response
    def check_answer
        if @user_input == "#{@response}"
            puts "Player #{@player}: Yes!  That is the correct answer!"
            @answer = true
        elsif
            puts "Player #{@player}: Pardon Me?  No, that is incorrect."
        end
    end
end


# Temporary code to start a game
game = Game_Logic.new

game.play