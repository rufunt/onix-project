require 'rails_helper'

RSpec.describe "Managers", type: :request do
  let(:valid_attributes) {{
    first_name: Faker::FunnyName.name,
    last_name: "MyString",
    email: Faker::Internet.unique.email,
    password: Faker::Internet.base64
  }}

  describe "POST /create" do
    it "creates a new Manager" do
      expect {
        post managers_url, params: { manager: valid_attributes }
      }.to change(Manager, :count).by(1)
    end

    xit "redirects to the created manager" do
      post managers_url, params: { manager: valid_attributes }
      expect(response).to redirect_to(manager_url(Manager.last))
    end
  end

  describe "GET /show" do
    xit "renders a successful response" do
      manager = Manager.create! valid_attributes
      get manager_url(manager)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    let(:new_attributes) {{
    first_name: Faker::FunnyName.name,
    last_name: "MyString new",
    email: Faker::Internet.unique.email,
    password: Faker::Internet.base64
  }}

    it "updates the requested manager" do
      manager = Manager.create! valid_attributes
      patch manager_url(manager), params: { manager: new_attributes }
      manager.reload
      skip("Add assertions for updated state")
    end

    xit "redirects to the manager" do
      manager = Manager.create! valid_attributes
      patch manager_url(manager), params: { manager: new_attributes }
      manager.reload
      expect(response).to redirect_to(manager_url(manager))
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested manager" do
      manager = Manager.create! valid_attributes
      expect {
        delete manager_url(manager)
      }.to change(Manager, :count).by(-1)
    end

    xit "redirects to the users list" do
      manager = Manager.create! valid_attributes
      delete manager_url(manager)
      expect(response).to redirect_to(managers_url)
    end
  end
end
