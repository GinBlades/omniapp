require "rails_helper"

RSpec.describe Budget::PayeesController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_budget_payee) { assigns(:budget_payee) }
    let(:base_budget_payee) { create(:budget_payee) }
    let(:static_budget_payee) { create(:budget_payee, name: "spec-budget_payee") }
    let(:valid_attributes) { attributes_for(:budget_payee, name: "spec-budget_payee") }
    let(:invalid_attributes) { attributes_for(:budget_payee, name: nil) }
    describe "GET #index" do
      it "populates an array of all @budget_payees" do
        second_budget_payee = create :budget_payee
        get :index
        expect(assigns(:budget_payees)).to match_array([base_budget_payee, second_budget_payee])
      end
    end
    describe "GET show" do
      it "assigns the requested budget_payee as @budget_payee" do
        get :show, id: base_budget_payee
        expect(instance_budget_payee).to eq(base_budget_payee)
      end
    end
    describe "GET new" do
      it "assigns a new budget_payee as @budget_payee" do
        get :new
        expect(instance_budget_payee).to be_a_new(Budget::Payee)
      end
    end
    describe "GET edit" do
      it "assigns the requested budget_payee as @budget_payee" do
        get :edit, id: base_budget_payee
        expect(instance_budget_payee).to eq(base_budget_payee)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Budget::Payee" do
          expect do
            post :create, budget_payee: attributes_for(:budget_payee)
          end.to change(Budget::Payee, :count).by(1)
        end

        it "assigns a newly created budget_payee as @budget_payee" do
          post :create, budget_payee: attributes_for(:budget_payee)
          expect(instance_budget_payee).to be_a(Budget::Payee)
          expect(instance_budget_payee).to be_persisted
        end

        it "redirects to the created budget_payee" do
          post :create, budget_payee: attributes_for(:budget_payee)
          expect(response).to redirect_to(Budget::Payee.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved budget_payee as @budget_payee" do
          post :create, budget_payee: invalid_attributes
          expect(instance_budget_payee).to be_a_new(Budget::Payee)
        end

        it "re-renders the 'new' template" do
          post :create, budget_payee: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested budget_payee as @budget_payee" do
          put :update, id: static_budget_payee, budget_payee: valid_attributes
          static_budget_payee.reload
          expect(instance_budget_payee).to eq(static_budget_payee)
        end

        it "redirects to the budget_payee" do
          put :update, id: static_budget_payee, budget_payee: valid_attributes
          expect(response).to redirect_to(static_budget_payee)
        end
      end

      describe "with invalid params" do
        it "assigns the budget_payee as @budget_payee" do
          put :update, id: static_budget_payee, budget_payee: invalid_attributes
          expect(assigns(:budget_payee)).to eq(static_budget_payee)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_budget_payee, budget_payee: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested budget_payee" do
        new_budget_payee = create :budget_payee
        expect do
          delete :destroy, id: new_budget_payee
        end.to change(Budget::Payee, :count).by(-1)
      end

      it "redirects to the budget_payee list" do
        delete :destroy, id: base_budget_payee
        expect(response).to redirect_to(budget_payees_url)
      end
    end
  end
end
