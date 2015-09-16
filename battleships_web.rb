require 'sinatra/base'
require './lib/boardprinter'
require_relative 'lib/water'
require_relative 'lib/ship'
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/cell'
require_relative 'lib/board'

class BattleshipsWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/new_game' do
    @name = params[:name]
    erb :new_game
  end

  get '/board' do
    @name = params[:name]
    board1 = Board.new(Cell)
    player1 = Player.new
    player1.board = board1
    player1.random_setup
    @board_html = player1.board.htmlprint
    erb :board
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  set :views, proc { File.join(root, 'views') }
end
