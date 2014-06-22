class Api::ScoresController < Api::BaseController

  load_and_authorize_resource

  def index
    respond_with @scores
  end

  def show
    respond_with @score
  end

  def update
    @score.update_attributes(score_params)
    respond_with @score
  end

protected

  def score_params
    params[:score].permit(:value)
  end

end
