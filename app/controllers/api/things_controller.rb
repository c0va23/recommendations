class Api::ThingsController < Api::BaseController
  load_and_authorize_resource

  def index
    @things = @things.recommendations_for(current_user) if params[:recommendations]
    @things.includes!(:tags)
    respond_with @things
  end

  def show
    respond_with @thing
  end

end
