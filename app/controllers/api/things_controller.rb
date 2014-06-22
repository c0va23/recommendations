class Api::ThingsController < Api::BaseController
  load_and_authorize_resource

  def index
    @things = @things.recommendations_for(current_user) if params[:recommendations]
    @things = @things.unchecked_for(current_user) if params[:unchecked]
    @things = @things.checked_for(current_user) if params[:checked]
    @things.preload!(:tags)
    respond_with @things
  end

  def show
    respond_with @thing
  end

end
