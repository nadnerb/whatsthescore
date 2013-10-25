Whatsthescore::App.controllers :games do

  get :index do
    @games = Game.all
    render 'games/index'
  end

  get :show, :with => :id do
    @game = Game.find(params[:id].to_i)

    render 'games/show'
  end

  post :create do
    players = Oj.load(request.body)['players']

    half = (players.length/BigDecimal(2)).round(0, BigDecimal::ROUND_UP).to_i
    players = players.each_slice(half).to_a

    @game = Game.create(key: SecureRandom.uuid, team_a: Team.from_players(players[0]), team_b: Team.from_players(players[1]))

    render 'games/create'
  end

  post :team_a, :with => :id do
    game = Game.find(params[:id])
    game.score_team_a
    score_response game, game.team_a
  end

  post :team_b, :with => :id do
    game = Game.find(params[:id])
    game.score_team_b
    score_response game, game.team_b
  end
end
