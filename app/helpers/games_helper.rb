Whatsthescore::App.helpers do
  def score_response game, team
    Oj.dump({ "score" => game.score, "status" => game.status, "encouragement" => "Less hand waving, more hitting",  "scoring_team" => team.name })
  end
end
