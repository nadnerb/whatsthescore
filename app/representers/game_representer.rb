require 'roar/representer/json/hal'

module GameRepresenter
  include Roar::Representer::JSON::HAL

  property :team_a, extend: TeamRepresenter, class: Team
  property :team_b, extend: TeamRepresenter, class: Team

  link :self do
    Whatsthescore::App.url(:games, :show, id: id)
  end

  link :score_a do
    Whatsthescore::App.url(:games, :team_a, id: team_a)
  end

  link :score_b do
    Whatsthescore::App.url(:games, :team_b, id: team_b)
  end

  link :undo do
    Whatsthescore::App.url(:games, :undo, id: id)
  end
end