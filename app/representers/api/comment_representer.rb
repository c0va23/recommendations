module Api::CommentRepresenter
  include Roar::Representer::JSON

  property :message
  property :created_at
  property :user_name

end
