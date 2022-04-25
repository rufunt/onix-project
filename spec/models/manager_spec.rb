require 'rails_helper'

RSpec.describe Manager, type: :model do
  describe 'Manager' do
    let(:manager) { FactoryBot.create :manager }
    
    context 'validates' do
      it { expect(manager).to validate_presence_of(:email) }
      it { expect(manager).to validate_uniqueness_of(:email) }
      it { expect(manager).to validate_presence_of(:first_name) }
    end

    context 'method #fullname' do
      it 'get full name' do
        full_name = manager.first_name + " " + manager.last_name
        expect(manager.fullname).to eq full_name
      end
    end
  end
end
