class Api::ScoresController < Api::BaseController

  load_and_authorize_resource

  def index
    respond_with @scores
  end

  def show
    respond_with @score
  end

end
