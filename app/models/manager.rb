class Manager < ApplicationRecord
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :first_name, :last_name, length: {
    minimum: 2,
    maximum: 500,
    wrong_length: 'Invalid length'
  }
  validates :password, length: { in: 6..20 }

  def fullname
    "#{self.first_name} #{self.last_name}"
  end
end
