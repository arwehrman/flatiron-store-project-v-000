class Item < ActiveRecord::Base
  has_many :line_items
  belongs_to :category
  has_many :carts, through: :line_items

  def self.available_items
   self.where("inventory > ?", 0)
  end
end
