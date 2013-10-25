Whatsthescore::App.controllers :teams do

  get :index do
    @teams = Team.all
    render 'teams/index'
  end

end
