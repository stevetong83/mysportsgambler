class PagesController < ApplicationController
  def index
    @page_title = "My Sports Gambler | Home"
    @blogs = Blog.order("created_at DESC").limit(5)
    @picks = Pick.order("game_day DESC").limit(10)
    @featured_post = Pick.featured
  end
end
