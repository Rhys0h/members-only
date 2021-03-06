class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def log_in(user)
  	remember_token = User.new_remember_token
  	cookies.permanent[:remember_digest] = remember_token
  	user.update_attribute(:remember_digest, User.digest(remember_token))
  	current_user=(user)
  end

  def current_user
  	remember_digest = User.digest(cookies[:remember_digest])
  	@current_user ||= User.find_by(remember_digest: remember_digest)
  end

  def current_user=(user)
    @current_user = user
  end

  

  def log_out
  	cookies.delete(:remember_digest)
  	@current_user = nil
  end

end
