class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  belongs_to :category

  def self.available_items
   self.where("inventory > ?", 0)
  end
end
