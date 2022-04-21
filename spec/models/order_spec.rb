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
    end

  end
end
