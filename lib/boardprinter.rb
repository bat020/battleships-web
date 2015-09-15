require_relative 'board'
require_relative 'cell'
require_relative 'water'

class BoardPrinter

attr_reader :board

def initialize(board)
  @board = board
end

def HTMLprint
  letters = 'ABCDEFGHIJ'
  outstring = ''
  (1..10).to_a.each do |row|
    rowstring = ''
    (0..9).to_a.each do |col|
      coord = (letters[col] + row.to_s).to_sym
      rowstring << (self.board.grid[coord].hit? ? 'X' : '·')
    end
    rowstring = "<p>" + rowstring + "</p>\n"
    outstring << rowstring
  end
  outstring
end

end
