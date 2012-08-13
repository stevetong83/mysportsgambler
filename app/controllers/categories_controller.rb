class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => :show
  load_and_authorize_resource :except => :show

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create params[:category]
    if @category.save
      flash[:notice] = "Category Created"
      redirect_to upcomingpicks_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    @category.update_attributes params[:category]
    if @category.save
      flash[:notice] = "Category updated"
      redirect_to categories_path
    else
      render "edit"
    end
  end

  def show
    @categories = Category.all
    @category = Category.find params[:id]
    @category_picks = @category.picks.paginate :page => params[:page],
                                                :per_page => 10,
                                                :order => "game_day ASC"

    @picks_win = Pick.count(:conditions => ['outcome = ?', 'Win'])
    @picks_loss = Pick.count(:conditions => ['outcome = ?', 'Loss'])
    @picks_win_thirty = Pick.where('game_day >= ?', 30.days.ago).where('outcome = ?', 'Win' ).count
    @picks_loss_thirty = Pick.where('game_day >= ?', 30.days.ago).where('outcome = ?', 'Loss' ).count

  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    flash[:notice] = "Category has been deleted"
    redirect_to categories_path
  end
end
