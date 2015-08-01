require 'rails_helper'

RSpec.describe PeopleController, type: :controller do

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
      post :create, person: attributes_for(:person)
      expect(response).to redirect_to(people_path)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      person = create(:person)
      get :edit, id: person.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      person = create(:person)
      patch :update, id: person.id, person: attributes_for(:person)
      expect(response).to redirect_to(people_path)
    end
  end
end
