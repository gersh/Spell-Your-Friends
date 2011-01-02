class ApplicationController < ActionController::Base
  protect_from_forgery
  protected

  def current_user
    @_current_user ||= session[:current_user_id]  && Facebook.find(session[:current_user_id])
  end
end
