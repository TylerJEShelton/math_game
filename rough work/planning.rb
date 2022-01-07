class Game_Logic
    # attr_accessor :player_1_lives, :player_2_lives

    def initialize
        @player_1_lives = 3
        @player_2_lives = 3
        @is_over = false
    end

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

    def initiate_turn
        while !@is_over
            turn = Turn.new(@player_1_lives, @player_2_lives)
            @player_1_lives, @player_2_lives, @is_over = turn.start_turn
        end
    end

    def check_winner
        if @player_1_lives > @player_2_lives
            congrats(1, @player_1_lives)
        else 
            congrats(2, @player_2_lives)
        end

    end

    def congrats(player, lives)
        puts "Congrats Player #{player}!  You win with a score of #{lives}/3!\n\n"
    end

    def game_over
        puts "----- GAME OVER -----"
        puts "Thank you for playing, good bye!"
    end
    
    # This class will store the lives of the player, start and end a game, the state of the current game.
    # This class will initiate a Turn if the game is not over
    
    # methods
    
    # start game
    # reset game or just end the game???
    # initiate a turn
    # check game over
    
end

class Turn
    
    def initialize(p1_lives, p2_lives)
        @current_player = 1
        @player_1_lives = p1_lives
        @player_2_lives = p2_lives
        @is_over = false
    end
    
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
    # This class will complete a turn.  It will ask player 1 a question from the question class and check the answer from the question class.
    # This class will then send a response to the user based on the answer.
    # This class will then repeat this process for player 2.
    
    # methods 
    
    # Start turn
    
end

class Question

    # This class will create a random math question, get the input from the user, check the answer and return true or false based on the users answer

    # methods 

    # generate question
    # check answer

    attr_reader :player

    @user_input = ""

    def initialize(player)
        @player = player
        @answer = false
    end

    def new_question
        puts "Player #{@player}: What does 5 plus 3 equal?"
        get_user_response
        check_answer
        return @answer
    end
    
    def get_user_response
        print "> "
        @user_input = $stdin.gets.chomp
    end

    def check_answer
        if @user_input == "8"
            puts "Player #{@player}: Yes!  That is the correct answer!"
            @answer = true
        elsif
            puts "Player #{@player}: Pardon Me?  No, that is incorrect."
        end
    end
end

game = Game_Logic.new

puts game.play