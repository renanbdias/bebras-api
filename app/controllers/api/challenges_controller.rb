class Api::ChallengesController < ApplicationController
  before_action :authenticate_api_deputy!, only: [:index, :create, :start_challenge, :end_challenge, :competitors]
  before_action :authenticate_api_competitor!, only: [:firebase_token, :get_challenge]

  def index
    response = GetChallengesService.call(deputy: current_api_deputy)
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  def create
    response = CreateChallengeService.call(start_date: create_params[:start_date], deputy: current_api_deputy, name: create_params[:name])
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  def competitors
    response = GetCompetitorsFromChallenge.call(deputy: current_api_deputy, challenge_id: competitors_params[:id])
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  def start_challenge
    response = StartChallengeService.call(deputy: current_api_deputy, challenge_id: start_challenge_params[:id])
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

  def end_challenge
    response = EndChallengeService.call(deputy: current_api_deputy, challenge_id: end_challenge_params[:id])
    if response.success?
      render json: response.result, status: :ok
    else
      render_error response.error
    end
  end

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
end
