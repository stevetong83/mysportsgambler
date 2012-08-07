class CommentsController < ApplicationController

  def create
    @comment = Article.comments.build params[:comment]
    if @comment.save
      redirect_to :back
    else
      flash[:notice] = "Comment could not be saved"
      redirect_to :back
    end

  end

  def destroy

  end
end
