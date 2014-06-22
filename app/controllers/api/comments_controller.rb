class Api::CommentsController < Api::BaseController

  load_and_authorize_resource :thing
  load_and_authorize_resource :comment, through: :thing

  def index
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

end
