class Question
    attr_reader :answer

    # Constants
    MAX_RANGE = 100

    # Initialize variables
    def initialize(player)
        answer = false
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
        return answer
    end

    # This method generates a random question
    def get_random_question
        operands = ["+", "-", "*"]
        first_number = rand(MAX_RANGE)
        second_number = rand(MAX_RANGE)
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
            answer = true
        elsif
            puts "Player #{@player}: Pardon Me?  No, that is incorrect."
        end
    end
end