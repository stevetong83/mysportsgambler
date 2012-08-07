class PicksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

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
  end

  def edit
  end

  def update

  end

  def destroy

  end

end
