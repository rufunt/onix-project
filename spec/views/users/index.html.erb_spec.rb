require 'rails_helper'

RSpec.describe "users/index.html.erb", type: :view do
  let(:valid_user) { FactoryBot.create(:user, first_name: 'John', last_name: 'Dow', email: 'test@test.com') }
  
  it "Index info about user" do
    assign(:users, [valid_user])
    render
    expect(rendered).to match /New User/
    expect(rendered).to match valid_user.last_name
    expect(rendered).to match valid_user.email
  end

  it "Index link to main list" do
    assign(:users, [valid_user])
    
    render
    expect(rendered).to match 'Back to Home'
  end
end
