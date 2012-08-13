class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  before_filter :picks, :except => [:new, :create, :edit, :update, :destroy]

  def picks
    time = Time.now - 1.day
    @picks_history = Pick.where("game_day < ?", time).order("game_day DESC").limit(10)
  end
end
