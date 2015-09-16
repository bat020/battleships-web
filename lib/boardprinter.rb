
# module BoardPrinter

#   def htmlprint
#     letters = 'ABCDEFGHIJ'
#     outstring = "<div style= 'font-family: monospace'><p>&nbsp;&nbsp;&nbsp;A B C D E F G H I J</p>"
#     [*1..10].each do |row|
#       rowstring = row.to_s + '&nbsp;'
#       if row < 10
#         rowstring = '&nbsp;' + rowstring
#       end
#       [*0..9].each do |col|
#         coord = (letters[col] + row.to_s).to_sym
#         # rowstring << (@grid[coord].hit? ? 'X&nbsp;' : '·&nbsp;')
#         if grid[coord].content.class == Water
#           if grid[coord].hit?
#             rowstring += "m "
#           else
#             rowstring += ". "
#           end
#         else
#           if grid[coord].hit?
#             rowstring += "x "
#           else
#             rowstring += "s "
#           end
#         end
#       end
#       rowstring = "<p>" + rowstring + "</p>"
#       outstring << rowstring
#     end
#     outstring = outstring + "</div>"
#     outstring
#   end

# end