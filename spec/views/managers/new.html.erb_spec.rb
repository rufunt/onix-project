require 'rails_helper'

RSpec.describe "managers/new.html.erb", type: :view do
  let(:valid_manager) { FactoryBot.create(:manager, first_name: ‘John’, last_name: ‘Dow’, email: 'test@test.com') }
  
  it "Show info about manager" do
    assign(:manager, valid_manager)
    render
    expect(rendered).to match valid_manager.first_name
    expect(rendered).to match valid_manager.last_name
    expect(rendered).to match valid_manager.email
  end

  it "Show link to main list" do
    assign(:manager, valid_manager)
    
    render
    expect(rendered).to match ‘Back’
  end
end
