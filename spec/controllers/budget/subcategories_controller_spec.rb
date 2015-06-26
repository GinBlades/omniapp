require "rails_helper"

RSpec.describe Budget::SubcategoriesController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_budget_subcategory) { assigns(:budget_subcategory) }
    let(:base_budget_subcategory) { create(:budget_subcategory) }
    let(:static_budget_subcategory) { create(:budget_subcategory, name: "spec-budget_subcategory") }
    let(:valid_attributes) { attributes_for(:budget_subcategory, name: "spec-budget_subcategory") }
    let(:invalid_attributes) { attributes_for(:budget_subcategory, name: nil) }
    describe "GET #index" do
      it "populates an array of all @budget_subcategories" do
        second_budget_subcategory = create :budget_subcategory
        get :index
        expect(assigns(:budget_subcategories)).to match_array([base_budget_subcategory, second_budget_subcategory])
      end
    end
    describe "GET show" do
      it "assigns the requested budget_subcategory as @budget_subcategory" do
        get :show, id: base_budget_subcategory
        expect(instance_budget_subcategory).to eq(base_budget_subcategory)
      end
    end
    describe "GET new" do
      it "assigns a new budget_subcategory as @budget_subcategory" do
        get :new
        expect(instance_budget_subcategory).to be_a_new(Budget::Subcategory)
      end
    end
    describe "GET edit" do
      it "assigns the requested budget_subcategory as @budget_subcategory" do
        get :edit, id: base_budget_subcategory
        expect(instance_budget_subcategory).to eq(base_budget_subcategory)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Budget::Subcategory" do
          expect do
            post :create, budget_subcategory: attributes_for(:budget_subcategory)
          end.to change(Budget::Subcategory, :count).by(1)
        end

        it "assigns a newly created budget_subcategory as @budget_subcategory" do
          post :create, budget_subcategory: attributes_for(:budget_subcategory)
          expect(instance_budget_subcategory).to be_a(Budget::Subcategory)
          expect(instance_budget_subcategory).to be_persisted
        end

        it "redirects to the created budget_subcategory" do
          post :create, budget_subcategory: attributes_for(:budget_subcategory)
          expect(response).to redirect_to(Budget::Subcategory.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved budget_subcategory as @budget_subcategory" do
          post :create, budget_subcategory: invalid_attributes
          expect(instance_budget_subcategory).to be_a_new(Budget::Subcategory)
        end

        it "re-renders the 'new' template" do
          post :create, budget_subcategory: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested budget_subcategory as @budget_subcategory" do
          put :update, id: static_budget_subcategory, budget_subcategory: valid_attributes
          static_budget_subcategory.reload
          expect(instance_budget_subcategory).to eq(static_budget_subcategory)
        end

        it "redirects to the budget_subcategory" do
          put :update, id: static_budget_subcategory, budget_subcategory: valid_attributes
          expect(response).to redirect_to(static_budget_subcategory)
        end
      end

      describe "with invalid params" do
        it "assigns the budget_subcategory as @budget_subcategory" do
          put :update, id: static_budget_subcategory, budget_subcategory: invalid_attributes
          expect(assigns(:budget_subcategory)).to eq(static_budget_subcategory)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_budget_subcategory, budget_subcategory: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested budget_subcategory" do
        new_budget_subcategory = create :budget_subcategory
        expect do
          delete :destroy, id: new_budget_subcategory
        end.to change(Budget::Subcategory, :count).by(-1)
      end

      it "redirects to the budget_subcategory list" do
        delete :destroy, id: base_budget_subcategory
        expect(response).to redirect_to(budget_subcategories_url)
      end
    end
  end
end
