class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.timestamps
    end

    create_table :players_teams do |t|
      t.belongs_to :team
      t.belongs_to :player
    end
  end
end
