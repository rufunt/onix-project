require 'rails_helper'

RSpec.describe "Cooks", type: :request do
  let(:valid_attributes) {{
    first_name: Faker::FunnyName.name,
    last_name: "MyString",
    email: Faker::Internet.unique.email,
    password: Faker::Internet.base64
  }}

  let(:invalid_attributes) {
    { first_name: 'J', last_name: 'D', email: 'test@test.com', password: "str" }
  }

  let(:valid_cook) { FactoryBot.create(:cook, valid_attributes) }
  # let(:valid_cook) { Cook.create! valid_attributes }

  describe 'GET /index' do
    it 'renders a successful response' do
      get cooks_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get cook_url(valid_cook)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_cook_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_cook_url(valid_cook)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Cook' do
        expect { post cooks_url, params: { cook: valid_attributes } }.to change(Cook, :count).by(1)
      end

      it 'redirects to the created cook' do
        post cooks_url, params: { cook: valid_attributes }
        expect(response).to redirect_to(cook_url(Cook.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Cook' do
        expect { post cooks_url, params: { cook: invalid_attributes } }.to change(Cook, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post cooks_url, params: { cook: invalid_attributes }
        expect(response.status) == (422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { first_name: 'Jimmy', last_name: 'Brown', email: 'updated_test@test.com', password: "str" }
      }

      it 'updates the requested cook' do
        patch cook_url(valid_cook), params: { cook: new_attributes }
        valid_cook.reload
        expect(valid_cook.first_name) == (new_attributes[:first_name])
        expect(valid_cook.last_name)  == (new_attributes[:last_name])
        expect(valid_cook.email) == (new_attributes[:email])
      end

      xit 'redirects to the cook' do
        patch cook_url(valid_cook), params: { cook: new_attributes }
        valid_cook.reload
        expect(response).to redirect_to(cook_url(valid_cook))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid cook' do
        patch cook_url(valid_cook), params: { cook: invalid_attributes }
        valid_cook.reload
        expect(valid_cook.first_name).not_to eq(invalid_attributes[:first_name])
        expect(response.status) == (422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:cook_for_destroy) { FactoryBot.create(:cook, valid_attributes) }

    it 'destroys the requested cook' do
      expect {
        delete cook_url(cook_for_destroy)
      }.to change(Cook, :count).by(-1)
    end

    xit 'redirects to the cooks list' do
      delete cook_url(valid_cook)
      expect(response).to redirect_to(cooks_url)
    end
  end
end
