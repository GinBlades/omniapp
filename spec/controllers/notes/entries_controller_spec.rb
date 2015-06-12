require 'rails_helper'

RSpec.describe Notes::EntriesController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_notes_entry) { assigns(:notes_entry) }
    let(:base_notes_entry) { create(:notes_entry) }
    let(:static_notes_entry) { create(:notes_entry, name: 'spec-notes_entry') }
    let(:valid_attributes) { attributes_for(:notes_entry, name: 'spec-notes_entry') }
    let(:invalid_attributes) { attributes_for(:notes_entry, name: nil) }
    describe "GET #index" do
      it "populates an array of all @notes_entries" do
        second_notes_entry = create :notes_entry
        get :index
        expect(assigns(:notes_entries)).to match_array([base_notes_entry, second_notes_entry])
      end
    end
    describe "GET show" do
      it "assigns the requested notes_entry as @notes_entry" do
        get :show, id: base_notes_entry
        expect(instance_notes_entry).to eq(base_notes_entry)
      end
    end
    describe "GET new" do
      it "assigns a new notes_entry as @notes_entry" do
        get :new
        expect(instance_notes_entry).to be_a_new(Notes::Entry)
      end
    end
    describe "GET edit" do
      it "assigns the requested notes_entry as @notes_entry" do
        get :edit, id: base_notes_entry
        expect(instance_notes_entry).to eq(base_notes_entry)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Notes::Entry" do
          expect do
            post :create, notes_entry: attributes_for(:notes_entry)
          end.to change(Notes::Entry, :count).by(1)
        end

        it "assigns a newly created notes_entry as @notes_entry" do
          post :create, notes_entry: attributes_for(:notes_entry)
          expect(instance_notes_entry).to be_a(Notes::Entry)
          expect(instance_notes_entry).to be_persisted
        end

        it "redirects to the created notes_entry" do
          post :create, notes_entry: attributes_for(:notes_entry)
          expect(response).to redirect_to(Notes::Entry.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved notes_entry as @notes_entry" do
          post :create, notes_entry: invalid_attributes
          expect(instance_notes_entry).to be_a_new(Notes::Entry)
        end

        it "re-renders the 'new' template" do
          post :create, notes_entry: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested notes_entry as @notes_entry" do
          put :update, id: static_notes_entry, notes_entry: valid_attributes
          static_notes_entry.reload
          expect(instance_notes_entry).to eq(static_notes_entry)
        end

        it "redirects to the notes_entry" do
          put :update, id: static_notes_entry, notes_entry: valid_attributes
          expect(response).to redirect_to(static_notes_entry)
        end
      end

      describe "with invalid params" do
        it "assigns the notes_entry as @notes_entry" do
          put :update, id: static_notes_entry, notes_entry: invalid_attributes
          expect(assigns(:notes_entry)).to eq(static_notes_entry)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_notes_entry, notes_entry: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested notes_entry" do
        new_notes_entry = create :notes_entry
        expect do
          delete :destroy, id: new_notes_entry
        end.to change(Notes::Entry, :count).by(-1)
      end

      it "redirects to the notes_entry list" do
        delete :destroy, id: base_notes_entry
        expect(response).to redirect_to(notes_entries_url)
      end
    end
  end
end
