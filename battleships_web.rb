require 'sinatra/base'
require './lib/boardprinter'

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
    @board = BoardPrinter.new(Board.new(Cell)).HTMLprint
    erb :board
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  set :views, proc { File.join(root, 'views') }
end
