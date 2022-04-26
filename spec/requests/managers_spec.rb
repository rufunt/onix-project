require 'rails_helper'

RSpec.describe "Managers", type: :request do
  let(:manager) { FactoryBot.create(:manager) }

  context 'actions crud' do
    
    it 'checks that a manager can be created' do
      expect(manager).to be_valid
    end

    it 'checks that a manager can be read' do
      expect(Manager.find(manager.id)) == (1)
    end

    it 'checks that a manager can be updated' do
      manager.update(:last_name => "#{manager.last_name} new")
      expect(Manager.find_by_last_name("#{manager.last_name} new")).to eq(@manager)
    end

    it 'checks that a manager can be destroyed' do
      manager.destroy
      expect(Manager.count).to eq(0)
    end
  end
end
