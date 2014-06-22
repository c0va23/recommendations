class Api::ThingsController < Api::BaseController
  load_and_authorize_resource

  def index
    respond_with @things
  end

  def show
    respond_with @thing
  end

end
