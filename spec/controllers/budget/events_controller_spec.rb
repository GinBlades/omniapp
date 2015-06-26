require "rails_helper"

RSpec.describe Budget::EventsController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_budget_event) { assigns(:budget_event) }
    let(:base_budget_event) { create(:budget_event) }
    let(:static_budget_event) { create(:budget_event, name: "spec-budget_event") }
    let(:valid_attributes) { attributes_for(:budget_event, name: "spec-budget_event") }
    let(:invalid_attributes) { attributes_for(:budget_event, name: nil) }
    describe "GET #index" do
      it "populates an array of all @budget_events" do
        second_budget_event = create :budget_event
        get :index
        expect(assigns(:budget_events)).to match_array([base_budget_event, second_budget_event])
      end
    end
    describe "GET show" do
      it "assigns the requested budget_event as @budget_event" do
        get :show, id: base_budget_event
        expect(instance_budget_event).to eq(base_budget_event)
      end
    end
    describe "GET new" do
      it "assigns a new budget_event as @budget_event" do
        get :new
        expect(instance_budget_event).to be_a_new(Budget::Event)
      end
    end
    describe "GET edit" do
      it "assigns the requested budget_event as @budget_event" do
        get :edit, id: base_budget_event
        expect(instance_budget_event).to eq(base_budget_event)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Budget::Event" do
          expect do
            post :create, budget_event: attributes_for(:budget_event)
          end.to change(Budget::Event, :count).by(1)
        end

        it "assigns a newly created budget_event as @budget_event" do
          post :create, budget_event: attributes_for(:budget_event)
          expect(instance_budget_event).to be_a(Budget::Event)
          expect(instance_budget_event).to be_persisted
        end

        it "redirects to the created budget_event" do
          post :create, budget_event: attributes_for(:budget_event)
          expect(response).to redirect_to(Budget::Event.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved budget_event as @budget_event" do
          post :create, budget_event: invalid_attributes
          expect(instance_budget_event).to be_a_new(Budget::Event)
        end

        it "re-renders the 'new' template" do
          post :create, budget_event: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested budget_event as @budget_event" do
          put :update, id: static_budget_event, budget_event: valid_attributes
          static_budget_event.reload
          expect(instance_budget_event).to eq(static_budget_event)
        end

        it "redirects to the budget_event" do
          put :update, id: static_budget_event, budget_event: valid_attributes
          expect(response).to redirect_to(static_budget_event)
        end
      end

      describe "with invalid params" do
        it "assigns the budget_event as @budget_event" do
          put :update, id: static_budget_event, budget_event: invalid_attributes
          expect(assigns(:budget_event)).to eq(static_budget_event)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_budget_event, budget_event: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested budget_event" do
        new_budget_event = create :budget_event
        expect do
          delete :destroy, id: new_budget_event
        end.to change(Budget::Event, :count).by(-1)
      end

      it "redirects to the budget_event list" do
        delete :destroy, id: base_budget_event
        expect(response).to redirect_to(budget_events_url)
      end
    end
  end
end
