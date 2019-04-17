class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email])
	        if user && user.authenticate(params[:session][:password])
			cookies.permanent.signed[:user_id] = user.id
			flash[:notice] = "Success!"
      			redirect_to root_url
		else
			flash[:notice] = "Email or password is invalid"
			redirect_to "/"
		end	

	end

	def destroy
		cookies.delete(:user_id)
		flash[:notice] = "Logged out"
	        redirect_to root_url
 	end
end
