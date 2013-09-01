class Category < ActiveRecord::Base
  self.inheritance_column = nil

  has_many :sorted_transactions

  CATEGORY_TYPES = ['Flexible', 'Essential', 'Income']

  validates :name, :presence => true, :uniqueness => true

  validates :type, :presence => true, :inclusion => {:in => CATEGORY_TYPES}
end
