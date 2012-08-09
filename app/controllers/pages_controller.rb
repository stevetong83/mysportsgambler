class PagesController < ApplicationController
  def index
    @page_title = "My Sports Gambler | Home"
    @blogs = Blog.all
    @picks = Pick.all
  end
end
