class GameProxy < Weary::Client
  get :index, "http://localhost:3000/games"

  get :show, "http://localhost:3000/games/show/{id}" do |resource|
    resource.required :id
  end

  post :create, 'http://localhost:3000/games/create/' do |resource|
  end
end
