class CashDesk < ApplicationRecord
  validates :all_balance, :cook_balance, presence: true
  validates :all_balance, :cook_balance, numericality: { only_decimal: true, greater_than_or_equal_to: 0 }
end
