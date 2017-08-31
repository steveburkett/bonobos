require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  render_views

  describe "GET #index" do
    before do
      Product.create!(name: 'cool jeans', image_url: 'http://test.url', description: 'very cool jeans')
    end

    it "returns http success" do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing expected Product attributes" do
      get :index, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.count).to eq 1
      expect(parsed_response.first['name']).to eq 'cool jeans'
      expect(parsed_response.first['description']).to eq 'very cool jeans'
    end
  end
end