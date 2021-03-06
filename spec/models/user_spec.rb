require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User' do
    let(:user) { FactoryBot.create :user }
    
    context 'validates' do
      it { expect(user).to validate_presence_of(:email) }
      it { expect(user).to validate_uniqueness_of(:email) }
      it { expect(user).to validate_presence_of(:first_name) }
    end

    context 'associations' do
      it 'has many orders' do
        expect(user).to respond_to :orders
      end
    end
  end

end
