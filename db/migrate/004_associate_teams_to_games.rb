class AssociateTeamsToGames < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.belongs_to :team_a, class_name: 'Team'
      t.belongs_to :team_b, class_name: 'Team'
    end
  end

end
