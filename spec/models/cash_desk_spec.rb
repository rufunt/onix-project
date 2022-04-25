require 'rails_helper'

RSpec.describe CashDesk, type: :model do
  describe 'CashDesk' do
    let(:cash_desk) { FactoryBot.create :cash_desk }
    
    context 'validates' do
      it { expect(cash_desk).to validate_presence_of(:all_balance) }
      it { expect(cash_desk).to validate_presence_of(:cook_balance) }
      it { expect(cash_desk).to validate_numericality_of(:all_balance) }
      it { expect(cash_desk).to validate_numericality_of(:cook_balance) }
    end
  end
end
