class Api::ChallengesController < ApplicationController
  before_action :authenticate_api_deputy!, only: :index

  def index
    response = GetChallengesService.call(deputy: current_api_deputy)
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

end
