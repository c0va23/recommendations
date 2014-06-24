module Api::ThingRepresenter
  include Roar::Representer::JSON

  property :id
  property :name
  collection :tags, getter: -> * { self.tags.map(&:value) }

end
