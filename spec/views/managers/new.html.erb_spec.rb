require 'rails_helper'

RSpec.describe "managers/new.html.erb", type: :view do
  let(:valid_manager) { FactoryBot.create(:manager, first_name: 'John', last_name: 'Dow', email: 'test@test.com') }
  
  it "New info about manager" do
    assign(:manager, valid_manager)
    render
    expect(rendered).to match /New/
    expect(rendered).to match /Last name/
    expect(rendered).to match /First name/
    expect(rendered).to match /password/
    expect(rendered).to match /email/
  end

  it "New link to main list" do
    assign(:manager, valid_manager)
    
    render
    expect(rendered).to match 'Back'
  end
end
