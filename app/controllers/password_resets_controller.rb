class PasswordResetsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:password_reset][:email].downcase)
		if @user.create_reset_digest
			@user.send_password_reset_email
			flash[:info] = "Email sent with password reset instructions"
			redirect_to root_url
		else
			flash.now[:danger] = "Email address not found"
			render 'new'
		end
	end

	def edit
		@user = User.find_by(email: params[:email])
	end

	def update
		@user = User.find_by(email: params[:email])
		@user.update password: params[:user][:password]
		flash[:success] = "Password reset!"
		redirect_to root_url
	end
end

