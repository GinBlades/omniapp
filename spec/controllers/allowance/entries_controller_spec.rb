require 'rails_helper'

RSpec.describe Allowance::EntriesController, type: :controller do

  
  describe 'Standard CRUD' do
    let(:instance_allowance_entry) { assigns(:allowance_entry) }
    let(:base_allowance_entry) { create(:allowance_entry) }
    let(:static_allowance_entry) { create(:allowance_entry, name: 'spec-allowance_entry') }
    let(:valid_attributes) { attributes_for(:allowance_entry, name: 'spec-allowance_entry') }
    let(:invalid_attributes) { attributes_for(:allowance_entry, name: nil) }
    describe 'GET #index' do
      it 'populates an array of all @allowance_entries' do
        second_allowance_entry = create :allowance_entry
        get :index
        expect(assigns(:allowance_entries)).to match_array([base_allowance_entry, second_allowance_entry])
      end
    end
    describe 'GET show' do
      it 'assigns the requested allowance_entry as @allowance_entry' do
        get :show, id: base_allowance_entry
        expect(instance_allowance_entry).to eq(base_allowance_entry)
      end
    end
    describe 'GET new' do
      it 'assigns a new allowance_entry as @allowance_entry' do
        get :new
        expect(instance_allowance_entry).to be_a_new(Allowance::Entry)
      end
    end
    describe 'GET edit' do
      it 'assigns the requested allowance_entry as @allowance_entry' do
        get :edit, id: base_allowance_entry
        expect(instance_allowance_entry).to eq(base_allowance_entry)
      end
    end
    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Allowance::Entry' do
          expect do
            post :create, allowance_entry: attributes_for(:allowance_entry)
          end.to change(Allowance::Entry, :count).by(1)
        end

        it 'assigns a newly created allowance_entry as @allowance_entry' do
          post :create, allowance_entry: attributes_for(:allowance_entry)
          expect(instance_allowance_entry).to be_a(Allowance::Entry)
          expect(instance_allowance_entry).to be_persisted
        end

        it 'redirects to the created allowance_entry' do
          post :create, allowance_entry: attributes_for(:allowance_entry)
          expect(response).to redirect_to(Allowance::Entry.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved allowance_entry as @allowance_entry' do
          post :create, allowance_entry: invalid_attributes
          expect(instance_allowance_entry).to be_a_new(Allowance::Entry)
        end

        it "re-renders the 'new' template" do
          post :create, allowance_entry: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        it 'assigns the requested allowance_entry as @allowance_entry' do
          put :update, id: static_allowance_entry, allowance_entry: valid_attributes
          static_allowance_entry.reload
          expect(instance_allowance_entry).to eq(static_allowance_entry)
        end

        it 'redirects to the allowance_entry' do
          put :update, id: static_allowance_entry, allowance_entry: valid_attributes
          expect(response).to redirect_to(static_allowance_entry)
        end
      end

      describe 'with invalid params' do
        it 'assigns the allowance_entry as @allowance_entry' do
          put :update, id: static_allowance_entry, allowance_entry: invalid_attributes
          expect(assigns(:allowance_entry)).to eq(static_allowance_entry)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_allowance_entry, allowance_entry: invalid_attributes
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested allowance_entry' do
        new_allowance_entry = create :allowance_entry
        expect do
          delete :destroy, id: new_allowance_entry
        end.to change(Allowance::Entry, :count).by(-1)
      end

      it 'redirects to the allowance_entry list' do
        delete :destroy, id: base_allowance_entry
        expect(response).to redirect_to(allowance_entries_url)
      end
    end

  end
end
