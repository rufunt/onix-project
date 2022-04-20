require 'rails_helper'

RSpec.describe Cook, type: :model do
  describe 'Cook' do
    let(:cook) { FactoryBot.create :cook }
    
    context 'validates' do
      it { expect(cook).to validate_presence_of(:email) }
      it { expect(cook).to validate_uniqueness_of(:email) }
      it { expect(cook).to validate_presence_of(:first_name) }
    end
  end
end
