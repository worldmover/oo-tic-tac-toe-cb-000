class TicTacToe
  def initialize(board=Array.new(9," "))
    @board=board
  end
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(input)
     input=input.to_i
     input=input-1
     @input=input
   end

   def move(index,token="X")
     @board[index] = token
   end

   def position_taken?(index)
   if @board[index]!=" "
     return true
   end
   return false
   end

   def valid_move?(index)
  if @board[index]==" " && index>=0 && index <=8
    return true
  end
  return false
end

def turn_count
  c=0
  @board.each{|place|
if place=="X" || place=="O"
  c+=1
end
  }
  return c
end

def current_player
  if turn_count%2==0
      return "X"
  end
  if turn_count%2==1
    return "O"
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.each do |win|
    if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
      return win
    end
    if @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
      return win
    end
  end
  return false
end

def full?
  if @board.none?{|el| el==" "} == true
    return true
  end
  return false
end

def draw?
  if full? && won? ==false
    return true
  end
  return false
end

def over?
  if won? || full? || draw?
    return true
  end
  return false
end

def winner
  if won?!=false
    return @board[won?[0]]
  end
  return nil
end

def play
  while over?!=true
    turn
  end

  if won?!=false
    puts "Congratulations #{winner}!"
  end

  if draw? == true
    puts "Cat's Game!"
  end
end

end
