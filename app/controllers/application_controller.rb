class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :user_islogged_in

  def index

  end

  def current_user
  	if session[:user_id]
        @current_user ||= User.find(session[:user_id])
        else
        @current_user = nil
        end
  end

  def is_user_logged_in?
  	if !session[:current_user]
  	      redirect_to root_path
 	end
  end
end
