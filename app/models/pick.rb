class Pick < ActiveRecord::Base
  attr_accessible :analysis, :game, :line, :pick, :user_id, :game_day, :featured, :outcome, :category_id, :profit, :loss, :image_url

  validates :game, :presence => true
  validates :pick, :presence => true
  validates :analysis, :presence => true
  validates :game_day, :presence => true
  validates :category_id, :presence => true
  validates :profit, :numericality => true, :allow_blank => true
  validates :loss, :numericality => true, :allow_blank => true

  belongs_to :user
  belongs_to :category

  scope :featured,:conditions => {:featured => true }

  def to_param
    "#{id}-#{game.gsub(/\W/, '-').downcase}"
  end



end
