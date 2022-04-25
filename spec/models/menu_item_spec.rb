require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  describe 'MenuItem' do
    let(:menu_item) { FactoryBot.create :menu_item }
    
    context 'validates' do
      it { expect(menu_item).to validate_presence_of(:title) }
      it { expect(menu_item).to validate_uniqueness_of(:title) }
      it { expect(menu_item).to validate_presence_of(:price) }
    end

    context 'associations' do
      it 'belongs to order' do
        expect(menu_item).to respond_to :order
      end
    end

  end
  
end
