require 'rails_helper'

RSpec.describe Dictionary::EntriesController, type: :controller do

  
  describe 'Standard CRUD' do
    let(:instance_dictionary_entry) { assigns(:dictionary_entry) }
    let(:base_dictionary_entry) { create(:dictionary_entry) }
    let(:static_dictionary_entry) { create(:dictionary_entry, name: 'spec-dictionary_entry') }
    let(:valid_attributes) { attributes_for(:dictionary_entry, name: 'spec-dictionary_entry') }
    let(:invalid_attributes) { attributes_for(:dictionary_entry, name: nil) }
    describe 'GET #index' do
      it 'populates an array of all @dictionary_entries' do
        second_dictionary_entry = create :dictionary_entry
        get :index
        expect(assigns(:dictionary_entries)).to match_array([base_dictionary_entry, second_dictionary_entry])
      end
    end
    describe 'GET show' do
      it 'assigns the requested dictionary_entry as @dictionary_entry' do
        get :show, id: base_dictionary_entry
        expect(instance_dictionary_entry).to eq(base_dictionary_entry)
      end
    end
    describe 'GET new' do
      it 'assigns a new dictionary_entry as @dictionary_entry' do
        get :new
        expect(instance_dictionary_entry).to be_a_new(Dictionary::Entry)
      end
    end
    describe 'GET edit' do
      it 'assigns the requested dictionary_entry as @dictionary_entry' do
        get :edit, id: base_dictionary_entry
        expect(instance_dictionary_entry).to eq(base_dictionary_entry)
      end
    end
    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Dictionary::Entry' do
          expect do
            post :create, dictionary_entry: attributes_for(:dictionary_entry)
          end.to change(Dictionary::Entry, :count).by(1)
        end

        it 'assigns a newly created dictionary_entry as @dictionary_entry' do
          post :create, dictionary_entry: attributes_for(:dictionary_entry)
          expect(instance_dictionary_entry).to be_a(Dictionary::Entry)
          expect(instance_dictionary_entry).to be_persisted
        end

        it 'redirects to the created dictionary_entry' do
          post :create, dictionary_entry: attributes_for(:dictionary_entry)
          expect(response).to redirect_to(Dictionary::Entry.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved dictionary_entry as @dictionary_entry' do
          post :create, dictionary_entry: invalid_attributes
          expect(instance_dictionary_entry).to be_a_new(Dictionary::Entry)
        end

        it "re-renders the 'new' template" do
          post :create, dictionary_entry: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        it 'assigns the requested dictionary_entry as @dictionary_entry' do
          put :update, id: static_dictionary_entry, dictionary_entry: valid_attributes
          static_dictionary_entry.reload
          expect(instance_dictionary_entry).to eq(static_dictionary_entry)
        end

        it 'redirects to the dictionary_entry' do
          put :update, id: static_dictionary_entry, dictionary_entry: valid_attributes
          expect(response).to redirect_to(static_dictionary_entry)
        end
      end

      describe 'with invalid params' do
        it 'assigns the dictionary_entry as @dictionary_entry' do
          put :update, id: static_dictionary_entry, dictionary_entry: invalid_attributes
          expect(assigns(:dictionary_entry)).to eq(static_dictionary_entry)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_dictionary_entry, dictionary_entry: invalid_attributes
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested dictionary_entry' do
        new_dictionary_entry = create :dictionary_entry
        expect do
          delete :destroy, id: new_dictionary_entry
        end.to change(Dictionary::Entry, :count).by(-1)
      end

      it 'redirects to the dictionary_entry list' do
        delete :destroy, id: base_dictionary_entry
        expect(response).to redirect_to(dictionary_entries_url)
      end
    end

  end
end
