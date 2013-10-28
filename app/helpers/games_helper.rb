Whatsthescore::App.helpers do
  def score_response game, team
    Oj.dump({ 
      "score" => game.score,
      "status" => game.status,
      "encouragement" => game.encouragement,
      "scoring_team" => team.name,
      "instructions" => game.instructions,
      "winning_team" => game.winning_team })
  end
end
