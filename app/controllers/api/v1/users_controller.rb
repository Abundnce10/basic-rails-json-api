module Api
	module V1
		class UsersController < ApplicationController
			before_filter :restrict_access
			before_filter :authorized_user, only: :show

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


			private

			def authorized_user
				if @current_user.id == params[:id].to_i
					return true
				else
					render json: { message: "Not authorized" }, status: 401
					return false
				end
			end

		end
	end
end