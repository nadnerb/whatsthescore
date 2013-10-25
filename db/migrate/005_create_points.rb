class CreatePoints < ActiveRecord::Migration
  def self.up
    create_table :points do |t|
      t.belongs_to :team
      t.belongs_to :game
    end

  end

  def self.down
    drop_table :points
  end
end
