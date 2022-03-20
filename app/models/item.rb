class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  attachment :image

  validates :image,        presence: true
  validates :name,         presence: true
  validates :introduction, presence: true
  validates :genre_id,     presence: true
	validates :price, 		   presence: true

end
