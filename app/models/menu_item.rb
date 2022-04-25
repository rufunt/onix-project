class MenuItem < ApplicationRecord
  validates :title, :price, presence: true
  validates :title, uniqueness: true
  
  belongs_to :order, optional: true
end
