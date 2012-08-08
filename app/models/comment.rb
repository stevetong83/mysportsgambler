class Comment < ActiveRecord::Base
  attr_accessible :body, :name

  validates :name, :presence => true
  validates :body, :presence => true

  belongs_to :blog

end
