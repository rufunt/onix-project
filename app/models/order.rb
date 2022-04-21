class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :menu_items
  
  validates :amount, presence: true

end
