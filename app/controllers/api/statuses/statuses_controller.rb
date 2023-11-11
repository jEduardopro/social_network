module Api
	module Statuses
		class StatusesController < ApplicationController

			def create
				render json: {}, status: :ok
			end

		end
	end
end