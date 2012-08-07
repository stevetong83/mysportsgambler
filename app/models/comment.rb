class Comment < ActiveRecord::Base
  attr_accessible :body, :name, :article_id

  validates :name, :presence => true
  validates :body, :presence => true

end
