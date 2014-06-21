class MainController < ApplicationController
  layout false

  before_action :require_user!

  def index
  end
end
