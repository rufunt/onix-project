require 'rails_helper'

RSpec.describe "managers/index.html.erb", type: :view do
  let(:valid_manager) { FactoryBot.create(:manager, first_name: 'John', last_name: 'Dow', email: 'test@test.com') }
  
  it "Index info about manager" do
    assign(:managers, [valid_manager])
    render
    expect(rendered).to match /New Manager/
    expect(rendered).to match valid_manager.last_name
    expect(rendered).to match valid_manager.email
  end

  it "Show link to main list" do
    assign(:managers, [valid_manager])
    
    render
    expect(rendered).to match 'Back to Home'
  end
end
