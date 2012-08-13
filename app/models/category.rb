class Category < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  has_many :picks, :dependent => :nullify

  def to_param
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end

end
