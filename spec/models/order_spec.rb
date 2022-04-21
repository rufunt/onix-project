require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Order' do
    let(:order) { FactoryBot.create :order }

    
    context 'validates' do
      it { expect(order).to validate_presence_of(:amount) }
    end

    context 'associations' do
      it 'has many menu_items' do
        expect(order).to respond_to :menu_items
      end

      it 'belongs to user' do
        expect(order).to respond_to :user
      end
    end

  end
end
