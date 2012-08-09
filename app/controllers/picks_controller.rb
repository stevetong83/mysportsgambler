class PicksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource :except => [:index, :show]

  def index
    @picks = Pick.all
  end

  def new
    @pick = Pick.new
  end

  def create
    @pick = current_user.picks.build params[:pick]
    if @pick.save
      flash[:notice] = "Pick has been created"
      redirect_to @pick
    else
      render "new"
    end
  end

  def show
    @picks = Pick.all
    @pick = Pick.find params[:id]
    @page_title = "#{@pick.game} | My Sports Gambler"
  end

  def edit
    @pick = Pick.find params[:id]
  end

  def update
    @pick = Pick.find params[:id]
    @pick.update_attributes params[:pick]
    if @pick.save
      flash[:notice] = "Pick has been updated"
      redirect_to @pick
    else
      render "edit"
    end
  end

  def destroy
    @pick = Pick.find params[:id]
    @pick.destroy
    flash[:notice] = "Pick has been deleted"
    redirect_to picks_path
  end

end
