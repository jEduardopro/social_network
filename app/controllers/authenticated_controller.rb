class AuthenticatedController < ApplicationController
	include ActionController::HttpAuthentication::Token::ControllerMethods
	include Api::ResponseHelper

	attr_reader :user

	before_action :authenticate_user
	append_before_action :after_authenticating

	def authenticate_user
		return true if @user.present?
		
		authenticate_with_http_token do |token|
			interactor = Sessions::DecodeAuthToken.call(token:)
			return false unless interactor.success?
			payload = interactor.result
			@user = User.find_by(uuid: payload['data']['uuid'])
			return false unless user.present?
			return true
		end
	end

	def after_authenticating
		render json: {message: "Unauthorized"}, status: :unauthorized unless user.present?
	end
end
