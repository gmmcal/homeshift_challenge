require 'rails_helper'

RSpec.describe HousesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, house: attributes_for(:house)
      expect(response).to redirect_to(houses_path)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      house = create(:house)
      get :edit, id: house.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #create" do
    it "returns http success" do
      house = create(:house)
      patch :update, id: house.id, house: attributes_for(:house)
      expect(response).to redirect_to(houses_path)
    end
  end
end
