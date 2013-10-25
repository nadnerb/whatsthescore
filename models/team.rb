class Team < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_many :games

  def self.from_players(players)
    players = players.map { |player| Player.find_by_handle(player) || Player.create(handle: player) }
    team = Team.all(:include => :players, :conditions => ["players.id in (?)", players]).first
    team = Team.create(players: players) unless team
    team
  end
end
