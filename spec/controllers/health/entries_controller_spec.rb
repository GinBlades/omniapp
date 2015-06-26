require "rails_helper"

RSpec.describe Health::EntriesController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_health_entry) { assigns(:health_entry) }
    let(:base_health_entry) { create(:health_entry) }
    let(:static_health_entry) { create(:health_entry, name: "spec-health_entry") }
    let(:valid_attributes) { attributes_for(:health_entry, name: "spec-health_entry") }
    let(:invalid_attributes) { attributes_for(:health_entry, name: nil) }
    describe "GET #index" do
      it "populates an array of all @health_entries" do
        second_health_entry = create :health_entry
        get :index
        expect(assigns(:health_entries)).to match_array([base_health_entry, second_health_entry])
      end
    end
    describe "GET show" do
      it "assigns the requested health_entry as @health_entry" do
        get :show, id: base_health_entry
        expect(instance_health_entry).to eq(base_health_entry)
      end
    end
    describe "GET new" do
      it "assigns a new health_entry as @health_entry" do
        get :new
        expect(instance_health_entry).to be_a_new(Health::Entry)
      end
    end
    describe "GET edit" do
      it "assigns the requested health_entry as @health_entry" do
        get :edit, id: base_health_entry
        expect(instance_health_entry).to eq(base_health_entry)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Health::Entry" do
          expect do
            post :create, health_entry: attributes_for(:health_entry)
          end.to change(Health::Entry, :count).by(1)
        end

        it "assigns a newly created health_entry as @health_entry" do
          post :create, health_entry: attributes_for(:health_entry)
          expect(instance_health_entry).to be_a(Health::Entry)
          expect(instance_health_entry).to be_persisted
        end

        it "redirects to the created health_entry" do
          post :create, health_entry: attributes_for(:health_entry)
          expect(response).to redirect_to(Health::Entry.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved health_entry as @health_entry" do
          post :create, health_entry: invalid_attributes
          expect(instance_health_entry).to be_a_new(Health::Entry)
        end

        it "re-renders the 'new' template" do
          post :create, health_entry: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested health_entry as @health_entry" do
          put :update, id: static_health_entry, health_entry: valid_attributes
          static_health_entry.reload
          expect(instance_health_entry).to eq(static_health_entry)
        end

        it "redirects to the health_entry" do
          put :update, id: static_health_entry, health_entry: valid_attributes
          expect(response).to redirect_to(static_health_entry)
        end
      end

      describe "with invalid params" do
        it "assigns the health_entry as @health_entry" do
          put :update, id: static_health_entry, health_entry: invalid_attributes
          expect(assigns(:health_entry)).to eq(static_health_entry)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_health_entry, health_entry: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested health_entry" do
        new_health_entry = create :health_entry
        expect do
          delete :destroy, id: new_health_entry
        end.to change(Health::Entry, :count).by(-1)
      end

      it "redirects to the health_entry list" do
        delete :destroy, id: base_health_entry
        expect(response).to redirect_to(health_entries_url)
      end
    end
  end
end
