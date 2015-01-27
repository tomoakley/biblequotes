class ApplicationController < ActionController::Base
  # define pages
  def about
  end
  def donate
  end
  def development
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
