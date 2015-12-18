require "rails_helper"

RSpec.describe Dog::EntriesController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_dog_entry) { assigns(:dog_entry) }
    let(:base_dog_entry) { create(:dog_entry) }
    let(:static_dog_entry) { create(:dog_entry, name: "spec-dog_entry") }
    let(:valid_attributes) { attributes_for(:dog_entry, name: "spec-dog_entry") }
    let(:invalid_attributes) { attributes_for(:dog_entry, name: nil) }
    describe 'GET #index' do
      it "populates an array of all @dog_entries" do
        second_dog_entry = create :dog_entry
        get :index
        expect(assigns(:dog_entries)).to match_array([base_dog_entry, second_dog_entry])
      end
    end
    describe "GET show" do
      it "assigns the requested dog_entry as @dog_entry" do
        get :show, id: base_dog_entry
        expect(instance_dog_entry).to eq(base_dog_entry)
      end
    end
    describe "GET new" do
      it "assigns a new dog_entry as @dog_entry" do
        get :new
        expect(instance_dog_entry).to be_a_new(Dog::Entry)
      end
    end
    describe "GET edit" do
      it "assigns the requested dog_entry as @dog_entry" do
        get :edit, id: base_dog_entry
        expect(instance_dog_entry).to eq(base_dog_entry)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Dog::Entry" do
          expect do
            post :create, dog_entry: attributes_for(:dog_entry)
          end.to change(Dog::Entry, :count).by(1)
        end

        it "assigns a newly created dog_entry as @dog_entry" do
          post :create, dog_entry: attributes_for(:dog_entry)
          expect(instance_dog_entry).to be_a(Dog::Entry)
          expect(instance_dog_entry).to be_persisted
        end

        it "redirects to the created dog_entry" do
          post :create, dog_entry: attributes_for(:dog_entry)
          expect(response).to redirect_to(Dog::Entry.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved dog_entry as @dog_entry" do
          post :create, dog_entry: invalid_attributes
          expect(instance_dog_entry).to be_a_new(Dog::Entry)
        end

        it "re-renders the 'new' template" do
          post :create, dog_entry: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested dog_entry as @dog_entry" do
          put :update, id: static_dog_entry, dog_entry: valid_attributes
          static_dog_entry.reload
          expect(instance_dog_entry).to eq(static_dog_entry)
        end

        it "redirects to the dog_entry" do
          put :update, id: static_dog_entry, dog_entry: valid_attributes
          expect(response).to redirect_to(static_dog_entry)
        end
      end

      describe "with invalid params" do
        it "assigns the dog_entry as @dog_entry" do
          put :update, id: static_dog_entry, dog_entry: invalid_attributes
          expect(assigns(:dog_entry)).to eq(static_dog_entry)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_dog_entry, dog_entry: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested dog_entry" do
        new_dog_entry = create :dog_entry
        expect do
          delete :destroy, id: new_dog_entry
        end.to change(Dog::Entry, :count).by(-1)
      end

      it "redirects to the dog_entry list" do
        delete :destroy, id: base_dog_entry
        expect(response).to redirect_to(dog_entries_url)
      end
    end
  end
end
