object @game

attributes :id, :key, :url, :undo_url

child :team_a => :team_a do |team|
  attributes :id
  node :score_url do |t|
    @game.score_url :team_a
  end
end

child :team_b => :team_b do |team|
  attributes :id
  node :score_url do |t|
    @game.score_url :team_b
  end
end

node :errors do |e|
  e.errors
end
