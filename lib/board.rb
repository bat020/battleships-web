require_relative 'water'
require_relative 'ship'
require_relative 'player'
require_relative 'game'
require_relative 'cell'

class Board
	attr_reader :grid

	def initialize(cell)
		@grid = {}
		[*"A".."J"].each do |l|
			[*1..10].each do |n|
				@grid["#{l}#{n}".to_sym] = cell.new
				@grid["#{l}#{n}".to_sym].content = Water.new
			end
		end
	end

	def htmlprint
    letters = 'ABCDEFGHIJ'
    outstring = "<div id='b0ard' style='font-family: monospace'><p>&nbsp;&nbsp;&nbsp;A B C D E F G H I J</p>"
    [*1..10].each do |row|
      rowstring = row.to_s + '&nbsp;'
      if row < 10
        rowstring = '&nbsp;' + rowstring
      end
      [*0..9].each do |col|
        coord = (letters[col] + row.to_s).to_sym
        if grid[coord].content.class == Water
          if grid[coord].hit?
            rowstring += "m "
          else
            rowstring += ". "
          end
        else
          if grid[coord].hit?
            rowstring += "x "
          else
						rowstring += grid[coord].content.size.to_s + " "
            # rowstring += "s "
          end
        end
      end
      rowstring = "<p>" + rowstring + "</p>"
      outstring << rowstring
    end
    outstring = outstring + "</div>"
    outstring
  end

	def place(ship, coord, orientation = :horizontally)
		coords = [coord]
		(ship.size - 1).times{coords << next_coord(coords.last, orientation)}
		put_on_grid_if_possible(coords, ship)
	end

	def floating_ships?
		ships.any?(&:floating?)
	end

	def shoot_at(coordinate)
		raise "You cannot hit the same square twice" if  grid[coordinate].hit?
		grid[coordinate].shoot
	end

	def ships
		grid.values.select{|cell|is_a_ship?(cell)}.map(&:content).uniq
	end

	def ships_count
		ships.count
	end

private

 	def next_coord(coord, orientation)
		orientation == :vertically ? next_vertical(coord) : coord.next
	end

	def next_vertical(coord)
		coord.to_s.reverse.next.reverse.to_sym
	end

	def is_a_ship?(cell)
		cell.content.respond_to?(:sunk?)
	end

	def any_coord_not_on_grid?(coords)
		(grid.keys & coords) != coords
	end

	def any_coord_is_already_a_ship?(coords)
		coords.any?{|coord| is_a_ship?(grid[coord])}
	end

	def raise_errors_if_cant_place_ship(coords)
		raise "You cannot place a ship outside of the grid" if any_coord_not_on_grid?(coords)
		raise "You cannot place a ship on another ship" if any_coord_is_already_a_ship?(coords)
	end

	def put_on_grid_if_possible(coords, ship)
		raise_errors_if_cant_place_ship(coords)
		coords.each{|coord|grid[coord].content = ship}
	end

end
