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
  outstring = "<div style= 'font-family: monospace'><p>&nbsp;&nbsp;&nbsp;A&nbsp;B&nbsp;C&nbsp;D&nbsp;E&nbsp;F&nbsp;G&nbsp;H&nbsp;I&nbsp;J&nbsp;</p>\n"
  (1..10).to_a.each do |row|
    rowstring = row.to_s + '&nbsp;'
    if row < 10
      rowstring = '&nbsp;' + rowstring
    end
    (0..9).to_a.each do |col|
      coord = (letters[col] + row.to_s).to_sym
      rowstring << (self.board.grid[coord].hit? ? 'X&nbsp;' : '·&nbsp;')
    end
    rowstring = "<p>" + rowstring + "</p>"
    rowstring << "\n"
    outstring << rowstring
  end
  outstring = outstring + "</div>"
  outstring
end

end
