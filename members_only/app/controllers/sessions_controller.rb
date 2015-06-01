class SessionsController < ApplicationController
include SessionsHelper

	def new
	end
	
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			flash.now[:success] = 'Successful sign-in!'
			sign_in user
			redirect_to root_path
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render 'new'
		end
	end
	
	def destroy
		sign_out
		redirect_to root_path
	end
	
	

	
end