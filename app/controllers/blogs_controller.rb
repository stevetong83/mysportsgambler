class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create params[:blog]
    if @blog.save
      flash[:notice] = "Blog has been created"
      redirect_to @blog
    else
      render "new"
    end
  end

  def show
    @blog = Blog.find params[:id]
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
