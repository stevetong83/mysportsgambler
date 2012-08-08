class Blog < ActiveRecord::Base
  attr_accessible :author, :body, :title, :user_id

  validates :title, :presence => true
  validates :author, :presence => true
  validates :body, :presence => true

  belongs_to :user
  has_many :comments, :dependent => :destroy

end
