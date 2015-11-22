require "rails_helper"

RSpec.describe Notes::SequencesController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_notes_sequence) { assigns(:notes_sequence) }
    let(:base_notes_sequence) { create(:notes_sequence) }
    let(:static_notes_sequence) { create(:notes_sequence, name: "spec-notes_sequence") }
    let(:valid_attributes) { attributes_for(:notes_sequence, name: "spec-notes_sequence") }
    let(:invalid_attributes) { attributes_for(:notes_sequence, name: nil) }
    describe 'GET #index' do
      it "populates an array of all @notes_sequences" do
        second_notes_sequence = create :notes_sequence
        get :index
        expect(assigns(:notes_sequences)).to match_array([base_notes_sequence, second_notes_sequence])
      end
    end
    describe "GET show" do
      it "assigns the requested notes_sequence as @notes_sequence" do
        get :show, id: base_notes_sequence
        expect(instance_notes_sequence).to eq(base_notes_sequence)
      end
    end
    describe "GET new" do
      it "assigns a new notes_sequence as @notes_sequence" do
        get :new
        expect(instance_notes_sequence).to be_a_new(Notes::Sequence)
      end
    end
    describe "GET edit" do
      it "assigns the requested notes_sequence as @notes_sequence" do
        get :edit, id: base_notes_sequence
        expect(instance_notes_sequence).to eq(base_notes_sequence)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Notes::Sequence" do
          expect do
            post :create, notes_sequence: attributes_for(:notes_sequence)
          end.to change(Notes::Sequence, :count).by(1)
        end

        it "assigns a newly created notes_sequence as @notes_sequence" do
          post :create, notes_sequence: attributes_for(:notes_sequence)
          expect(instance_notes_sequence).to be_a(Notes::Sequence)
          expect(instance_notes_sequence).to be_persisted
        end

        it "redirects to the created notes_sequence" do
          post :create, notes_sequence: attributes_for(:notes_sequence)
          expect(response).to redirect_to(Notes::Sequence.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved notes_sequence as @notes_sequence" do
          post :create, notes_sequence: invalid_attributes
          expect(instance_notes_sequence).to be_a_new(Notes::Sequence)
        end

        it "re-renders the 'new' template" do
          post :create, notes_sequence: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested notes_sequence as @notes_sequence" do
          put :update, id: static_notes_sequence, notes_sequence: valid_attributes
          static_notes_sequence.reload
          expect(instance_notes_sequence).to eq(static_notes_sequence)
        end

        it "redirects to the notes_sequence" do
          put :update, id: static_notes_sequence, notes_sequence: valid_attributes
          expect(response).to redirect_to(static_notes_sequence)
        end
      end

      describe "with invalid params" do
        it "assigns the notes_sequence as @notes_sequence" do
          put :update, id: static_notes_sequence, notes_sequence: invalid_attributes
          expect(assigns(:notes_sequence)).to eq(static_notes_sequence)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_notes_sequence, notes_sequence: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested notes_sequence" do
        new_notes_sequence = create :notes_sequence
        expect do
          delete :destroy, id: new_notes_sequence
        end.to change(Notes::Sequence, :count).by(-1)
      end

      it "redirects to the notes_sequence list" do
        delete :destroy, id: base_notes_sequence
        expect(response).to redirect_to(notes_sequences_url)
      end
    end
  end
end
