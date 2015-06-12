require 'rails_helper'

RSpec.describe Health::CategoriesController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_health_category) { assigns(:health_category) }
    let(:base_health_category) { create(:health_category) }
    let(:static_health_category) { create(:health_category, name: 'spec-health_category') }
    let(:valid_attributes) { attributes_for(:health_category, name: 'spec-health_category') }
    let(:invalid_attributes) { attributes_for(:health_category, name: nil) }
    describe "GET #index" do
      it "populates an array of all @health_categories" do
        second_health_category = create :health_category
        get :index
        expect(assigns(:health_categories)).to match_array([base_health_category, second_health_category])
      end
    end
    describe "GET show" do
      it "assigns the requested health_category as @health_category" do
        get :show, id: base_health_category
        expect(instance_health_category).to eq(base_health_category)
      end
    end
    describe "GET new" do
      it "assigns a new health_category as @health_category" do
        get :new
        expect(instance_health_category).to be_a_new(Health::Category)
      end
    end
    describe "GET edit" do
      it "assigns the requested health_category as @health_category" do
        get :edit, id: base_health_category
        expect(instance_health_category).to eq(base_health_category)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Health::Category" do
          expect do
            post :create, health_category: attributes_for(:health_category)
          end.to change(Health::Category, :count).by(1)
        end

        it "assigns a newly created health_category as @health_category" do
          post :create, health_category: attributes_for(:health_category)
          expect(instance_health_category).to be_a(Health::Category)
          expect(instance_health_category).to be_persisted
        end

        it "redirects to the created health_category" do
          post :create, health_category: attributes_for(:health_category)
          expect(response).to redirect_to(Health::Category.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved health_category as @health_category" do
          post :create, health_category: invalid_attributes
          expect(instance_health_category).to be_a_new(Health::Category)
        end

        it "re-renders the 'new' template" do
          post :create, health_category: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested health_category as @health_category" do
          put :update, id: static_health_category, health_category: valid_attributes
          static_health_category.reload
          expect(instance_health_category).to eq(static_health_category)
        end

        it "redirects to the health_category" do
          put :update, id: static_health_category, health_category: valid_attributes
          expect(response).to redirect_to(static_health_category)
        end
      end

      describe "with invalid params" do
        it "assigns the health_category as @health_category" do
          put :update, id: static_health_category, health_category: invalid_attributes
          expect(assigns(:health_category)).to eq(static_health_category)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_health_category, health_category: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested health_category" do
        new_health_category = create :health_category
        expect do
          delete :destroy, id: new_health_category
        end.to change(Health::Category, :count).by(-1)
      end

      it "redirects to the health_category list" do
        delete :destroy, id: base_health_category
        expect(response).to redirect_to(health_categories_url)
      end
    end
  end
end
