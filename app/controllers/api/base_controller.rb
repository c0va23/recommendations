class Api::BaseController < ApplicationController
  include Roar::Rails::ControllerAdditions

  respond_to :json

end
