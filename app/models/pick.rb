class Pick < ActiveRecord::Base
  attr_accessible :analysis, :game, :line, :pick, :user_id, :game_day, :featured

  validates :game, :presence => true
  validates :pick, :presence => true
  validates :analysis, :presence => true
  validates :game_day, :presence => true

  belongs_to :user

  def to_param
    "#{id}-#{game.gsub(/\W/, '-').downcase}"
  end


end
