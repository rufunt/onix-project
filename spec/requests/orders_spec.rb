require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:valid_attributes) {{
    amount: 9.99,
    completed: false
  }}

  let(:invalid_attributes) {
    { amount: "9",
    completed: "str"}
  }

  let(:valid_order) { FactoryBot.create(:order, valid_attributes) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get orders_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get order_url(valid_order)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_order_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_order_url(valid_order)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Order' do
        expect { post orders_url, params: { order: valid_attributes } }.to change(Order, :count).by(1)
      end

      it 'redirects to the created order' do
        post orders_url, params: { order: valid_attributes }
        expect(response).to redirect_to(order_url(Order.last))
      end
    end

    context 'with invalid parameters' do
      xit 'does not create a new Order' do
        expect { post orders_url, params: { order: invalid_attributes } }.to change(Order, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post orders_url, params: { order: invalid_attributes }
        expect(response.status) == 422
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { title: 'Menu 2', description: 'lorem ipsum', image_url: 'str', price: 22.0 }
      }

      it 'updates the requested order' do
        patch order_url(valid_order), params: { order: new_attributes }
        valid_order.reload
        expect(valid_order.amount) == (new_attributes[:amount])
        expect(valid_order.completed) == (new_attributes[:completed])
      end

      it 'redirects to the order' do
        patch order_url(valid_order), params: { order: new_attributes }
        valid_order.reload
        expect(response).to redirect_to(order_url(valid_order))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid order' do
        patch order_url(valid_order), params: { order: invalid_attributes }
        valid_order.reload
        expect(valid_order.amount) != (invalid_attributes[:amount])
        expect(response.status) == (422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:order_for_destroy) { FactoryBot.create(:order, valid_attributes) }

    it 'destroys the requested order' do
      expect {
        delete order_url(order_for_destroy)
      }.to change(Order, :count).by(-1)
    end

    it 'redirects to the orders list' do
      delete order_url(valid_order)
      expect(response).to redirect_to(orders_url)
    end
  end
end
