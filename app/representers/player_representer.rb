require 'roar/representer/json/hal'

module PlayerRepresenter
  include Roar::Representer::JSON::HAL

  property :handle
end