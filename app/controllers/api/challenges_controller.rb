class Api::ChallengesController < ApplicationController
  before_action :authenticate_api_deputy!, only: [:index, :create, :start_challenge, :end_challenge, :competitors, :add_competitor, :update, :destroy, :remove_competitor]
  before_action :authenticate_api_competitor!, only: [:firebase_token, :get_challenge]
  # TODO change to except later

  ## GET /api/v1/challenges
  def index
    response = GetChallengesService.call(deputy: current_api_deputy)
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  ## POST /api/v1/challenges
  def create
    response = CreateChallengeService.call(start_date: create_params[:start_date], deputy: current_api_deputy, name: create_params[:name])
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  ## PATCH /api/v1/challenges/:id
  def update
    response = UpdateChallengeService.call(deputy: current_api_deputy, challenge_id: params[:id], challenge_params: update_params)
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  ## DELETE /api/v1/challenges/:id
  def destroy
    response = DeleteChallengeService.call(deputy: current_api_deputy, challenge_id: delete_params[:id])
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  ## GET /api/v1/challenges/:id/competitors
  def competitors
    response = GetCompetitorsFromChallenge.call(deputy: current_api_deputy, challenge_id: competitors_params[:id])
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  ## POST /api/v1/challenges/:id/remove_competitor
  def remove_competitor
    response = RemoveCompetitorService.call(deputy: current_api_deputy, challenge_id: params[:id], competitor_id: remove_competitor_params[:competitor_id])
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  ## POST /api/v1/challenges/:id/add_competitor
  def add_competitor
    response = AddCompetitorToChallengeService.call(deputy: current_api_deputy,
                                                    challenge_id: add_competitor_to_challenge_params[:id],
                                                    name: add_competitor_to_challenge_params[:name],
                                                    email: add_competitor_to_challenge_params[:email],
                                                    age: add_competitor_to_challenge_params[:age])
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  ## POST /api/v1/challenges/:id/start_challenge
  def start_challenge
    response = StartChallengeService.call(deputy: current_api_deputy, challenge_id: start_challenge_params[:id])
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  ## POST /api/v1/challenges/:id/end_challenge
  def end_challenge
    response = EndChallengeService.call(deputy: current_api_deputy, challenge_id: end_challenge_params[:id])
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  ## GET /api/v1/challenges/:id/firebase_token
  def firebase_token
    response = GetFirebaseTokenService.call(competitor: current_api_competitor)
    if response.success?
      render json: { firebase_token: response.result }, status: :ok
    else
      render_error response.error
    end
  end

  def current_server_time
    render json: DateTime.now, status: :ok
  end

  def get_challenge
    render json: current_api_competitor.challenge, status: :ok
  end

  private
    def remove_competitor_params
      params.permit(:competitor_id)
    end

    def update_params
      params.permit(:start_date, :name)
    end

    def delete_params
      params.permit(:id)
    end

    def competitors_params
      params.permit(:id)
    end

    def create_params
      params.permit(:start_date, :name)
    end

    def start_challenge_params
      params.permit(:id)
    end

    def end_challenge_params
      params.permit(:id)
    end

    def add_competitor_to_challenge_params
      params.permit(:id, :name, :email, :age)
    end
end
