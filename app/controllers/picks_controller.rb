class PicksController < ApplicationController

  before_filter :records, :except => [:new, :create, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show, :history, :picklist]
  load_and_authorize_resource :except => [:index, :show, :history, :picklist]

  def index
    time = Time.now - 1.day
    @upcoming_picks = Pick.where("game_day > ?", time).order("game_day ASC").limit(8)
    @featured_post = Pick.featured
    @page_title = "Winning Sports Picks | My Sports Gambler"
  end

  def history
    time = Time.now - 1.day
    @history_picks = Pick.where('game_day <= ?',  time).paginate  :page => params[:page],
                                                                  :per_page => 10,
                                                                  :order => "game_day DESC"
    @categories = Category.all
    @page_title = "My Sports Gambler Pick History"

  end

  def picklist
    time = Time.now - 1.day
    @upcoming_picks = Pick.where('game_day >= ?', time).paginate :page => params[:page],
            :per_page => 10,
            :order => "game_day ASC"
    @categories = Category.order('name').all
    @page_title = "My Sports Gambler Upcoming Picks"
  end


  def new
    @pick = Pick.new
    @page_title = "Create Sports Pick"
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
    @pick = Pick.find params[:id]
    @page_title = "#{@pick.game} | My Sports Gambler"
  end

  def edit
    @pick = Pick.find params[:id]
    @page_title = "Edit Pick"
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

  protected

  def records
    @picks_win = Pick.count(:conditions => ['outcome = ?', 'Win'])
    @picks_loss = Pick.count(:conditions => ['outcome = ?', 'Loss'])
    @picks_win_thirty = Pick.where('game_day >= ?', 30.days.ago).where('outcome = ?', 'Win' ).count
    @picks_loss_thirty = Pick.where('game_day >= ?', 30.days.ago).where('outcome = ?', 'Loss' ).count
  end


end
