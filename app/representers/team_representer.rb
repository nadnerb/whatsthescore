require 'roar/representer/json/hal'

module TeamRepresenter
  include Roar::Representer::JSON::HAL

  property :id
  property :name

  collection :players, extend: PlayerRepresenter, class: Player
end