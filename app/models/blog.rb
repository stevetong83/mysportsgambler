class Blog < ActiveRecord::Base
  attr_accessible :author, :body, :title, :user_id

  validates :title, :presence => true
  validates :author, :presence => true
  validates :body, :presence => true


end
