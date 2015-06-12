require 'rails_helper'

RSpec.describe Budget::EntriesController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_budget_entry) { assigns(:budget_entry) }
    let(:base_budget_entry) { create(:budget_entry) }
    let(:static_budget_entry) { create(:budget_entry, name: 'spec-budget_entry') }
    let(:valid_attributes) { attributes_for(:budget_entry, name: 'spec-budget_entry') }
    let(:invalid_attributes) { attributes_for(:budget_entry, name: nil) }
    describe "GET #index" do
      it "populates an array of all @budget_entries" do
        second_budget_entry = create :budget_entry
        get :index
        expect(assigns(:budget_entries)).to match_array([base_budget_entry, second_budget_entry])
      end
    end
    describe "GET show" do
      it "assigns the requested budget_entry as @budget_entry" do
        get :show, id: base_budget_entry
        expect(instance_budget_entry).to eq(base_budget_entry)
      end
    end
    describe "GET new" do
      it "assigns a new budget_entry as @budget_entry" do
        get :new
        expect(instance_budget_entry).to be_a_new(Budget::Entry)
      end
    end
    describe "GET edit" do
      it "assigns the requested budget_entry as @budget_entry" do
        get :edit, id: base_budget_entry
        expect(instance_budget_entry).to eq(base_budget_entry)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Budget::Entry" do
          expect do
            post :create, budget_entry: attributes_for(:budget_entry)
          end.to change(Budget::Entry, :count).by(1)
        end

        it "assigns a newly created budget_entry as @budget_entry" do
          post :create, budget_entry: attributes_for(:budget_entry)
          expect(instance_budget_entry).to be_a(Budget::Entry)
          expect(instance_budget_entry).to be_persisted
        end

        it "redirects to the created budget_entry" do
          post :create, budget_entry: attributes_for(:budget_entry)
          expect(response).to redirect_to(Budget::Entry.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved budget_entry as @budget_entry" do
          post :create, budget_entry: invalid_attributes
          expect(instance_budget_entry).to be_a_new(Budget::Entry)
        end

        it "re-renders the 'new' template" do
          post :create, budget_entry: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested budget_entry as @budget_entry" do
          put :update, id: static_budget_entry, budget_entry: valid_attributes
          static_budget_entry.reload
          expect(instance_budget_entry).to eq(static_budget_entry)
        end

        it "redirects to the budget_entry" do
          put :update, id: static_budget_entry, budget_entry: valid_attributes
          expect(response).to redirect_to(static_budget_entry)
        end
      end

      describe "with invalid params" do
        it "assigns the budget_entry as @budget_entry" do
          put :update, id: static_budget_entry, budget_entry: invalid_attributes
          expect(assigns(:budget_entry)).to eq(static_budget_entry)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_budget_entry, budget_entry: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested budget_entry" do
        new_budget_entry = create :budget_entry
        expect do
          delete :destroy, id: new_budget_entry
        end.to change(Budget::Entry, :count).by(-1)
      end

      it "redirects to the budget_entry list" do
        delete :destroy, id: base_budget_entry
        expect(response).to redirect_to(budget_entries_url)
      end
    end
  end
end
