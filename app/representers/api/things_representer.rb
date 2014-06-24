module Api::ThingsRepresenter
  include Roar::Representer::JSON
  include Representable::JSON::Collection

  items extend: ::Api::ThingRepresenter

end
