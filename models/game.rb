class Game < ActiveRecord::Base

  has_one :team_a, class_name: 'Team'
  has_one :team_b, class_name: 'Team'

end
