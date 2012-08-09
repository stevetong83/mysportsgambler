class BlogsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource :except => [:index, :show]


  def index
    @blogs = Blog.all
    @page_title = "My Sports Gambler Blog"
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build params[:blog]
    if @blog.save
      flash[:notice] = "Blog has been created"
      redirect_to @blog
    else
      render "new"
    end
  end

  def show
    @blogs = Blog.all
    @blog = Blog.find params[:id]
    @page_title = "#{@blog.title} | My Sports Gambler"
  end

  def edit
    @blog = Blog.find params[:id]
  end

  def update
    @blog = Blog.find params[:id]
    @blog.update_attributes params[:blog]
    if @blog.save
      flash[:notice] = "Blog has been updated"
      redirect_to @blog
    else
      render "edit"
    end
  end

  def destroy
    @blog = Blog.find params[:id]
    @blog.destroy
    flash[:notice] = "Blog has been deleted"
    redirect_to blogs_path
  end
end
