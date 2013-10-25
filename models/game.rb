class Game < ActiveRecord::Base

  belongs_to :team_a, class_name: 'Team'
  belongs_to :team_b, class_name: 'Team'

  def url
    "/games/#{id}/show"
  end

  def score_url team
  	"games/#{id}/#{team.id}"
  end
end
