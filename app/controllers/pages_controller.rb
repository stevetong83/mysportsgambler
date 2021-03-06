class PagesController < ApplicationController
  def index
    @page_title = "Sports Betting Information, Expert Sports Handicapping, Winning Sports Picks. | My Sports Gambler"
    @blogs = Blog.order("created_at DESC").limit(5)

    @featured_post = Pick.featured
    @picks_win = Pick.count(:conditions => ['outcome = ?', 'Win'])
    @picks_loss = Pick.count(:conditions => ['outcome = ?', 'Loss'])
    @picks_win_thirty = Pick.where('game_day >= ?', 30.days.ago).where('outcome = ?', 'Win' ).count
    @picks_loss_thirty = Pick.where('game_day >= ?', 30.days.ago).where('outcome = ?', 'Loss' ).count
  end
end
