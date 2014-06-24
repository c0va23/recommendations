module Api::CommentsRepresenter
  include Roar::Representer::JSON
  include Representable::JSON::Collection

  items extend: CommentRepresenter
end
