class CommentsController < ApplicationController
  before_filter :load_blog

  def create
    @comment = @blog.comments.build params[:comment]
    if @comment.save
      flash[:notice] = "Thanks for your comment"
      redirect_to @blog
    else
      flash[:notice] = "Comment could not be saved"
      redirect_to @blog
    end

  end

  def destroy
    @comment = @blog.comments.find params[:id]
    @comment.destroy
    flash[:notice] = "Comment deleted"
    redirect_to @blog

  end

  private
  def load_blog
    @blog = Blog.find params[:blog_id]
  end
end
