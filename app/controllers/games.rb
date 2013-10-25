Whatsthescore::App.controllers :games do

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

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

end
