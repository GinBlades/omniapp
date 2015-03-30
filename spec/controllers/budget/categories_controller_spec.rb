require 'rails_helper'

RSpec.describe Budget::CategoriesController, :type => :controller do

  
  describe "Standard CRUD" do
    let(:instance_budget_category) { assigns(:budget_category) }
    let(:base_budget_category) { create(:budget_category) }
    let(:static_budget_category) { create(:budget_category, name: 'spec-budget_category') }
    let(:valid_attributes) { attributes_for(:budget_category, name: 'spec-budget_category') }
    let(:invalid_attributes) { attributes_for(:budget_category, name: nil) }
    describe "GET #index" do
      it "populates an array of all @budget_categories" do
        second_budget_category = create :budget_category
        get :index
        expect(assigns(:budget_categories)).to match_array([base_budget_category, second_budget_category])
      end
    end
    describe "GET show" do
      it "assigns the requested budget_category as @budget_category" do
        get :show, id: base_budget_category
        expect(instance_budget_category).to eq(base_budget_category)
      end
    end
    describe "GET new" do
      it "assigns a new budget_category as @budget_category" do
        get :new
        expect(instance_budget_category).to be_a_new(Budget::Category)
      end
    end
    describe "GET edit" do
      it "assigns the requested budget_category as @budget_category" do
        get :edit, id: base_budget_category
        expect(instance_budget_category).to eq(base_budget_category)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Budget::Category" do
          expect {
            post :create, budget_category: attributes_for(:budget_category)
          }.to change(Budget::Category, :count).by(1)
        end

        it "assigns a newly created budget_category as @budget_category" do
          post :create, budget_category: attributes_for(:budget_category)
          expect(instance_budget_category).to be_a(Budget::Category)
          expect(instance_budget_category).to be_persisted
        end

        it "redirects to the created budget_category" do
          post :create, budget_category: attributes_for(:budget_category)
          expect(response).to redirect_to(Budget::Category.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved budget_category as @budget_category" do
          post :create, budget_category: invalid_attributes
          expect(instance_budget_category).to be_a_new(Budget::Category)
        end

        it "re-renders the 'new' template" do
          post :create, budget_category: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested budget_category as @budget_category" do
          put :update, id: static_budget_category, budget_category: valid_attributes
          static_budget_category.reload
          expect(instance_budget_category).to eq(static_budget_category)
        end

        it "redirects to the budget_category" do
          put :update, id: static_budget_category, budget_category: valid_attributes
          expect(response).to redirect_to(static_budget_category)
        end
      end

      describe "with invalid params" do
        it "assigns the budget_category as @budget_category" do
          put :update, id: static_budget_category, budget_category: invalid_attributes
          expect(assigns(:budget_category)).to eq(static_budget_category)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_budget_category, budget_category: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested budget_category" do
        new_budget_category = create :budget_category
        expect {
          delete :destroy, id: new_budget_category
        }.to change(Budget::Category, :count).by(-1)
      end

      it "redirects to the budget_category list" do
        delete :destroy, id: base_budget_category
        expect(response).to redirect_to(budget_categories_url)
      end
    end

  end
end
