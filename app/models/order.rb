class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :menu_items
  
  validates :amount, presence: true

  scope :completed, -> { where(completed: true) }
  scope :by_creation_date_desc, -> { order(created_at: :desc) }


end
