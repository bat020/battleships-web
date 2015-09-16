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
    outstring = "<div style= 'font-family: monospace'><p>&nbsp;&nbsp;&nbsp;A B C D E F G H I J</p>"
    [*1..10].each do |row|
      rowstring = row.to_s + '&nbsp;'
      if row < 10
        rowstring = '&nbsp;' + rowstring
      end
      [*0..9].each do |col|
        coord = (letters[col] + row.to_s).to_sym
        rowstring << (self.board.grid[coord].hit? ? 'X&nbsp;' : '·&nbsp;')
      end
      rowstring = "<p>" + rowstring + "</p>"
      outstring << rowstring
    end
    outstring = outstring + "</div>"
    outstring
  end

end
