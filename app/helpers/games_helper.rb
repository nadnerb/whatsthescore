Whatsthescore::App.helpers do
  def score game, team
    Oj.dump({ "score" => game.score, "status" => "continue", "encouragement" => "Less hand waving, more hitting",  "scoring_team" => "team_a" })
  end
end
