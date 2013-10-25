class Game < ActiveRecord::Base

  belongs_to :team_a, class_name: 'Team'
  belongs_to :team_b, class_name: 'Team'

  def url
    "/games/#{id}/show"
  end

  def score_url team
    "/games/#{team.to_s}/#{id}"
  end

  def score_team_a
    Point.create(game: self, team: self.team_a)
  end

  def score_team_b
    ::Point.create(game: self, team: self.team_b)
  end

  def score
    "#{Point.score(self.id, team_a.id).length}/#{Point.score(self.id, team_b.id).length}"
  end

  def status
    Point.score(self.id, team_a.id).length == 21 ? 'Team A Wins!' : Point.score(self.id, team_b.id).length == 21 ? 'Team B Wins' : 'Continue'
  end

end
