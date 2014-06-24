class Api::CommentsController < Api::BaseController

  load_and_authorize_resource :thing
  load_and_authorize_resource :comment, through: :thing

  after_action :trigger_new_comment, only: :create

  def index
    @comments.preload!(:user)
    respond_with @comments
  end

  def show
    respond_with @comment
  end

  def create
    @comment = @thing.comments.create(comment_params) do |comment|
      comment.user = current_user
    end
    respond_with @comment, location: [ :api, @thing, @comment ]
  end

protected

  def comment_params
    params.require(:comment).permit(:message)
  end

  def trigger_new_comment
    if @comment.persisted?
      comment_hash = @comment.dup.extend(::Api::CommentRepresenter).to_hash
      WebsocketRails["things/#{@thing.id}/comments"].trigger :new, comment_hash
    end
  end

end
