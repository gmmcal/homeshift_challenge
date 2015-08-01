require 'rails_helper'

RSpec.describe PeopleController, type: :controller do

  describe "GET #index" do
    before(:each) do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "assigns all people as @people" do
      person = create(:person)
      expect(assigns(:people)).to eq([person])
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

    it "assigns a new person as @person" do
      expect(assigns(:person)).to be_a_new(Person)
    end
  end

  describe "POST #create" do
    before(:each) do
      post :create, person: person_attributes
    end

    context "with valid params" do
      let(:person_attributes) { attributes_for(:person) }

      it "assigns a newly created person as @person" do
        expect(assigns(:person)).to be_a(Person)
      end

      it "a new person should be persisted" do
        expect(assigns(:person)).to be_persisted
      end

      it "redirects to person listing" do
        expect(response).to redirect_to(people_path)
      end
    end

    context "with invalid params" do
      let(:person_attributes) { attributes_for(:invalid_person) }

      it "assigns a newly created but unsaved person as @person" do
        expect(assigns(:person)).to be_a_new(Person)
      end

      it "re-renders the 'new' template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    let(:person) { create(:person) }

    before(:each) do
      get :edit, id: person.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end

    it "assigns the requested person as @person" do
      expect(assigns(:person)).to eq(person)
    end
  end

  describe "PATCH #update" do
    let(:person) { create(:person) }

    before(:each) do
      patch :update, id: person.id, person: person_attributes
    end

    context "with valid params" do
      let(:person_attributes) { attributes_for(:person) }

      it "returns http success" do
        expect(response).to redirect_to(people_path)
      end

      it "updates the requested person" do
        person.reload
        post_update_attributes = person.attributes.inject({}){|attrs,(k,v)| attrs[k.to_sym] = v; attrs}
        post_update_attributes.delete(:id)
        post_update_attributes.delete(:created_at)
        post_update_attributes.delete(:updated_at)
        expect(person_attributes).to eq(post_update_attributes)
      end

      it "assigns the requested person as @person" do
        expect(assigns(:person)).to eq(person)
      end
    end

    context "with invalid params" do
      let(:person_attributes) { attributes_for(:invalid_person) }

      it "assigns the person as @person" do
        expect(assigns(:person)).to eq(person)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:person) { create(:person) }

    before(:each) do
      delete :destroy, id: person.id
    end

    it "destroys the requested person" do
      expect(Person.exists?(person.id)).to be(false)
    end

    it "returns http success" do
      expect(response).to redirect_to(people_path)
    end
  end
end
