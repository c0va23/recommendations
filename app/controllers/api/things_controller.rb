class Api::ThingsController < Api::BaseController
  load_and_authorize_resource

  def index
    @things = @things.recommendations_for(current_user) if params[:recommendations]
    @things = @things.not_scored_for(current_user) if params[:unchecked]
    @things.preload!(:tags)
    respond_with @things
  end

  def show
    respond_with @thing
  end

end
