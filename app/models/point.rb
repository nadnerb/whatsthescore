class Point < ActiveRecord::Base

  belongs_to :team
  belongs_to :game

  scope :score, lambda { |game_id, team_id| where(game_id: game_id, team_id: team_id) }

end
