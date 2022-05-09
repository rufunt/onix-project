class Cook < ApplicationRecord
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :first_name, :last_name, length: {
    minimum: 2,
    maximum: 500,
    wrong_length: 'Invalid length'
  }
  validates :password, length: { in: 6..20 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
