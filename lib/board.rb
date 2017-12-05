class Board
   attr_accessor :cells

   def initialize
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def reset!
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def display
     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end

   def input_to_index(input)
     "#{input}".to_i - 1
   end

   def position(move)
     @cells[move.to_i - 1]
   end

   def full?
     if @cells.any? { |c| c == " "}
       false
     else
       true
     end
   end

   def turn_count
     counter = 0
     @cells.each do |index|
       if index == "X" || index == "O"
         counter += 1
       end
     end
     counter
   end

   def taken?(move)
     !(@cells[move.to_i - 1].nil? || @cells[move.to_i - 1] == " ")
   end

   def valid_move?(move)
     if taken?(move)
       puts "The position must be vacant, not currently taken by a player."
     elsif !(move.to_i - 1).between?(0, 8)
       puts "You must move to a position within the tic-tac-toe board."
     else false
       true
     end
   end

   def update(move, player)
     @cells[move.to_i - 1] = player.token
   end
 end
