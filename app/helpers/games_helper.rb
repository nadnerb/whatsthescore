Whatsthescore::App.helpers do
  def score_response game
    Oj.dump({ 
      "score" => game.score,
      "status" => game.status,
      "encouragement" => game.encouragement,
      "instructions" => game.instructions,
      "winning_team" => game.winning_team })
  end
end
