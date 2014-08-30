module Api
	module V1
		class UsersController < ApplicationController
			#before_filter :restrict_access 

			def show
				@user = User.find(params[:id])
				if @user
					render json: @user, status: 200
				else
					render json: { message: 'Error finding user' }, status: 404
				end
			end

			def create

			end

			def index
				@users = User.all
				render json: @users, status: 200
			end

		end
	end
end