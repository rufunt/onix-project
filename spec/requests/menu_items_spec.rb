require 'rails_helper'

RSpec.describe "MenuItems", type: :request do
  let(:valid_attributes) {{
    title: "MyString",
    description: "MyString",
    image_url: "MyString",
    price: 0.0
  }}

  let(:invalid_attributes) {
    { title: "M",
    description: "M",
    image_url: "MyString",
    price: "9" }
  }

  let(:valid_menu_item) { FactoryBot.create(:menu_item, valid_attributes) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get menu_items_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get menu_item_url(valid_menu_item)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_menu_item_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_menu_item_url(valid_menu_item)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new MenuItem' do
        expect { post menu_items_url, params: { menu_item: valid_attributes } }.to change(MenuItem, :count).by(1)
      end

      it 'redirects to the created menu_item' do
        post menu_items_url, params: { menu_item: valid_attributes }
        expect(response).to redirect_to(menu_item_url(MenuItem.last))
      end
    end

    context 'with invalid parameters' do
      # it 'does not create a new MenuItem' do
      #   expect { post menu_items_url, params: { menu_item: invalid_attributes } }.to change(MenuItem, :count).by(0)
      # end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post menu_items_url, params: { menu_item: invalid_attributes }
        expect(response.status) == 422
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { title: 'Menu 2', description: 'lorem ipsum', image_url: 'str', price: 22.0 }
      }

      it 'updates the requested menu_item' do
        patch menu_item_url(valid_menu_item), params: { menu_item: new_attributes }
        valid_menu_item.reload
        expect(valid_menu_item.title) == (new_attributes[:title])
        expect(valid_menu_item.description) == (new_attributes[:description])
        expect(valid_menu_item.price) == (new_attributes[:price])
      end

      it 'redirects to the menu_item' do
        patch menu_item_url(valid_menu_item), params: { menu_item: new_attributes }
        valid_menu_item.reload
        expect(response).to redirect_to(menu_item_url(valid_menu_item))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid menu_item' do
        patch menu_item_url(valid_menu_item), params: { menu_item: invalid_attributes }
        valid_menu_item.reload
        expect(valid_menu_item.title) != (invalid_attributes[:title])
        expect(response.status) == (422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:menu_item_for_destroy) { FactoryBot.create(:menu_item, valid_attributes) }

    it 'destroys the requested menu_item' do
      expect {
        delete menu_item_url(menu_item_for_destroy)
      }.to change(MenuItem, :count).by(-1)
    end

    # it 'redirects to the menu_items list' do
    #   delete menu_item_url(valid_menu_item)
    #   expect(response).to redirect_to(menu_items_url)
    # end
  end
end
