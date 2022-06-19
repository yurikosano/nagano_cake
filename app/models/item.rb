class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  belongs_to :order
  has_many :cart_items, dependent: :destroy

end
