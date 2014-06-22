class Api::ScoresController < Api::BaseController

  load_and_authorize_resource :thing

  before_action :load_score

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

  def load_score
    @score = @thing.scores.find_or_initialize_by(user: current_user)
  end

end
