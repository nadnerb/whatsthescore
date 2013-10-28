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
    Point.create(game: self, team: self.team_a) unless status == 'Game over'
  end

  def score_team_b
    ::Point.create(game: self, team: self.team_b) unless status == 'Game over'
  end

  def score
    "#{Point.score(self.id, team_a.id).length}/#{Point.score(self.id, team_b.id).length}"
  end

  def status
    (Point.score(self.id, team_a.id).length == 11 or Point.score(self.id, team_b.id).length == 11) ? 'Game over' : 'Continue'
  end

  def instructions
    instructions = []
    if total_points % 5 == 0
      instructions << 'change serve'
    end
    instructions
  end

  def winning_team
    Point.score(self.id, team_a.id).length > Point.score(self.id, team_b.id).length ? 'Team A' : 'Team B'
  end

  def encouragement
    encouragement = ''
    if total_points == 7
      encouragement = 'Less hand waving more hitting'
    end
    if total_points == 12
      encouragement = 'its not too late to forfeit'
    end
    encouragement
  end

  private
  def total_points
    Point.score(self.id, team_a.id).length + Point.score(self.id, team_b.id).length
  end

end
