require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryBot.create :user }
  
  context 'validates' do
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_uniqueness_of(:email) }
    it { expect(user).to validate_presence_of(:first_name) }
    #it { expect(user).to have_many(:orders) }
  end


end
