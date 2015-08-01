require 'rails_helper'

RSpec.describe HousesController, type: :controller do

  describe "GET #index" do
    let(:house1) { create(:house) }
    let(:house2) { create(:house) }

    before(:each) do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "assigns all houses as @houses" do
      expect(assigns(:houses)).to eq([house1, house2])
    end
  end

  describe "GET #available" do
    let(:person) { create(:person) }
    let(:house1) { create(:house) }
    let(:house2) { create(:house, tenant: person) }

    before(:each) do
      get :available
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the available template" do
      expect(response).to render_template(:available)
    end

    it "assigns all houses as @houses" do
      expect(assigns(:houses)).to eq([house1])
    end
  end

  describe "GET #show" do
    let(:house) { create(:house) }

    before(:each) do
      get :show, id: house.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      expect(response).to render_template(:show)
    end

    it "assigns the requested house as @house" do
      expect(assigns(:house)).to eq(house)
    end
  end

  describe "GET #new" do
    before(:each) do
      get :new
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      expect(response).to render_template(:new)
    end

    it "assigns a new house as @house" do
      expect(assigns(:house)).to be_a_new(House)
    end
  end

  describe "POST #create" do
    before(:each) do
      post :create, house: house_attributes
    end

    context "with valid params" do
      let(:house_attributes) { attributes_for(:house) }

      it "assigns a newly created house as @house" do
        expect(assigns(:house)).to be_a(House)
      end

      it "a new house should be persisted" do
        expect(assigns(:house)).to be_persisted
      end

      it "redirects to house listing" do
        expect(response).to redirect_to(houses_path)
      end
    end

    context "with invalid params" do
      let(:house_attributes) { attributes_for(:invalid_house) }

      it "assigns a newly created but unsaved house as @house" do
        expect(assigns(:house)).to be_a_new(House)
      end

      it "re-renders the 'new' template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    let(:house) { create(:house) }

    before(:each) do
      get :edit, id: house.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end

    it "assigns the requested house as @house" do
      expect(assigns(:house)).to eq(house)
    end
  end

  describe "PATCH #update" do
    let(:house) { create(:house) }

    before(:each) do
      patch :update, id: house.id, house: house_attributes
    end

    context "with valid params" do
      let(:house_attributes) { attributes_for(:house) }

      it "returns http success" do
        expect(response).to redirect_to(houses_path)
      end

      it "updates the requested house" do
        house.reload
        post_update_attributes = house.attributes.inject({}){|attrs,(k,v)| attrs[k.to_sym] = v; attrs}
        post_update_attributes.delete(:id)
        post_update_attributes.delete(:created_at)
        post_update_attributes.delete(:updated_at)
        expect(house_attributes).to eq(post_update_attributes)
      end

      it "assigns the requested house as @house" do
        expect(assigns(:house)).to eq(house)
      end
    end

    context "with invalid params" do
      let(:house_attributes) { attributes_for(:invalid_house) }

      it "assigns the house as @house" do
        expect(assigns(:house)).to eq(house)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:house) { create(:house) }

    before(:each) do
      delete :destroy, id: house.id
    end

    it "destroys the requested house" do
      expect(House.exists?(house.id)).to be(false)
    end

    it "redirects to the houses list" do
      expect(response).to redirect_to(houses_path)
    end
  end
end
