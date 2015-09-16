require 'sinatra/base'
require './lib/boardprinter'
require_relative 'lib/water'
require_relative 'lib/ship'
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/cell'
require_relative 'lib/board'

class BattleshipsWeb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/new_game' do
    erb :new_game
  end

  get '/board' do
    session[:name] = params[:name] unless (params[:name] == '' || params[:name] == nil)
    @name = session[:name]
    if session[:player1] == nil
      board1 = Board.new(Cell)
      player1 = Player.new
      player1.board = board1
      player1.random_setup
      session[:player1] = player1
    end
    unless (params[:coord] == '' || params[:coord] == nil)
      params[:coord].upcase!
      begin
        session[:player1].receive_shot(params[:coord].to_sym) # if params[:coord].index(/^[A-J](10|[1-9])$/)
      rescue
        nil
      end
    end
    @board_html = session[:player1].board.htmlprint
    # p session
    erb :board
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  set :views, proc { File.join(root, 'views') }
end
