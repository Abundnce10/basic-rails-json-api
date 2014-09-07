module Api
	module V1
		class SessionsController < ApplicationController

			def create
				@user = User.find_by_username(params[:username])

			  if BCrypt::Password.new(@user.password_hash) == params[:password]
			  	# if @user.api_key.expiration == valid?

				    render json: { session_token: @user.api_key.token,
				    							 session_token_expiration: @user.api_key.expires_at,
										 		 	 user_id: @user.id,
										 		 	 user_profile_url: "/api/v1/users/#{@user.id}" },
										 		 status: 201
						return true
			  else
			    render json: { message: "Not authorized" }, status: 401
			  end
			end


		end
	end
end