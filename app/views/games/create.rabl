object @game

attributes :id, :key, :url

child :team_a => :team_a do |team|
  attributes :id
  node :score_url do |t|
    @game.score_url team
  end
end

child :team_b => :team_b do |team|
  attributes :id
  node :score_url do |t|
    @game.score_url team
  end
end

node :errors do |e|
  e.errors
end
