require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }
  get '/' do
    erb :index
  end

  get '/new_game' do
    @player = params[:name]
    erb :new_game
  end

  get '/setup_game' do

    $game = Game.new(Player,Board)
    $game.player_2.place_ship(Ship.battleship, :A1, :vertically)
    $game.player_2.place_ship(Ship.aircraft_carrier, :C1, :vertically)
    $game.player_2.place_ship(Ship.cruiser, :E1, :vertically)
    $game.player_2.place_ship(Ship.destroyer, :G1, :vertically)
    $game.player_2.place_ship(Ship.submarine, :I1, :vertically)

    redirect '/play_game'

  end

  get '/play_game' do
    @board = $game.opponent_board_view $game.player_1
    erb :play_game
  end

  post '/play_game' do
    coord = params[:coord]
    begin
      if coord && coord != ""
        $game.player_1.shoot coord.to_sym
        @board = $game.opponent_board_view $game.player_1
      else
        erb :play_game
        @error = 'Enter coordinate'
      end
    rescue RuntimeError => @error
    #   # @error = 'Coordinate out of bounds - please enter valid coordinate'
    end
    erb :play_game
  end

  run! if app_file == $0
end
