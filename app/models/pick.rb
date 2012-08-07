class Pick < ActiveRecord::Base
  attr_accessible :analysis, :game, :line, :pick, :user_id

  validates :game, :presence => true
  validates :line, :presence => true
  validates :pick, :presence => true
  validates :analysis, :presence => true

  belongs_to :user
end
