require 'pry'

class TicTacToe
attr_accessor :board
WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]
]
    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    end
    def input_to_index(input)
        num = input.to_i - 1
        @board[num]
        return num
    end
    def move(index_board, token="X")
        # binding.pry
        token == "X" || token == "O"
        @board[index_board] = token
    end

    def position_taken?(index)
        if self.board[index] == "X" || self.board[index] == "O"
            true
        else
            false
        end 
    end
    
    def valid_move?(position)
        position.between?(0,8) && !self.position_taken?(position)
         
    end

    def turn_count
        self.board.find_all{|turn| turn == "X" || turn == "O"}.length
    end
    
    def current_player
        if turn_count.odd? == true
            return "O"
        else 
            return "X"
        end
    end

    def turn
        puts "Please enter 1-9"
        input = gets.strip
        position = input_to_index(input)
        if valid_move?(position)
            move(position, current_player)
         display_board
        else
            puts "Try again"
            turn
        end  
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            @board[combo[0]] == @board[combo[1]] &&
            @board[combo[1]] == @board[combo[2]] &&
            position_taken?(combo[0]) 
        end
    end

    def full?
        @board.all? {|taken| taken == "X" || taken == "O"}
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || draw?
    end

    def winner
        if combo = won?
            @board[combo.first]
        end
    end

    def play
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

    # def bin/tictactoe

end

# bin/tic_tac_toe.play


