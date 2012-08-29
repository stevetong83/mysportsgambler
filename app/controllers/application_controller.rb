class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  before_filter :picks, :except => [:new, :create, :edit, :update, :destroy]
  before_filter :money, :except => [:new, :create, :edit, :update, :destroy]
  before_filter :category

  def picks
    time = Time.now - 1.day
    @picks_history = Pick.where("game_day < ?", time).order("game_day DESC").limit(10)
  end

  def money
    @profit = Pick.where("game_day >= ?", 30.days.ago).sum('profit')
    @loss = Pick.where("game_day >= ?", 30.days.ago).sum('loss')
  end

  def category
    @categories = Category.order('name ASC').all
  end


end
