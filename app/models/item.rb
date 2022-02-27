class Item < ApplicationRecord

  belongs_to :genre
  attachment :image

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true

end
