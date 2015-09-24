class ApplicationController < ActionController::Base
  # define pages
  def about
  end
  def donate
  end
  def development
  end
  def index
    @quote = Quote.all.sample
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private 
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
