require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do
  render_views

  describe "GET #index" do
    before do
      product = Product.create!(name: 'cool jeans', image_url: 'http://test.url', description: 'very cool jeans')
      Inventory.create!(product_id: product.id, waist: 32, length: 32, style: 'chino')
    end

    it "returns http success" do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing expected Inventory attributes" do
      get :index, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.count).to eq 1
      expect(parsed_response.first['waist']).to eq 32
      expect(parsed_response.first['style']).to eq 'chino'
    end
  end
end