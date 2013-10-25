class Player < ActiveRecord::Base
  validates_presence_of :handle
end
