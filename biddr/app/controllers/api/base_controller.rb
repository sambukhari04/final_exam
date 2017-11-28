class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  # before_action :authenticate_api_user

  def current_user
    # headers: { 'authorization': 'JWT <token>' }
    # headers: { 'authorization': 'API_KEY <token>' }
    token_type, token = request.headers['AUTHORIZATION']&.split(" ") || []
    case token_type&.downcase
    when 'api_key'
      @user ||= User.find_by(api_key: token)
    when 'jwt'
      begin
        payload = JWT.decode(token, Rails.application.secrets.secret_key_base)&.first
        @user ||= User.find_by(id: payload["id"])
      rescue JWT::DecodeError => error
        nil
      end
    end
  end

  def authenticate_api_user
   @api_user = User.find_by_api_key request.headers['HTTP_API_KEY']
   head :unauthorized unless @api_user
  end
end
