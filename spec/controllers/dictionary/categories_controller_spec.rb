require 'rails_helper'

RSpec.describe Dictionary::CategoriesController, type: :controller do

  
  describe 'Standard CRUD' do
    let(:instance_dictionary_category) { assigns(:dictionary_category) }
    let(:base_dictionary_category) { create(:dictionary_category) }
    let(:static_dictionary_category) { create(:dictionary_category, name: 'spec-dictionary_category') }
    let(:valid_attributes) { attributes_for(:dictionary_category, name: 'spec-dictionary_category') }
    let(:invalid_attributes) { attributes_for(:dictionary_category, name: nil) }
    describe 'GET #index' do
      it 'populates an array of all @dictionary_categories' do
        second_dictionary_category = create :dictionary_category
        get :index
        expect(assigns(:dictionary_categories)).to match_array([base_dictionary_category, second_dictionary_category])
      end
    end
    describe 'GET show' do
      it 'assigns the requested dictionary_category as @dictionary_category' do
        get :show, id: base_dictionary_category
        expect(instance_dictionary_category).to eq(base_dictionary_category)
      end
    end
    describe 'GET new' do
      it 'assigns a new dictionary_category as @dictionary_category' do
        get :new
        expect(instance_dictionary_category).to be_a_new(Dictionary::Category)
      end
    end
    describe 'GET edit' do
      it 'assigns the requested dictionary_category as @dictionary_category' do
        get :edit, id: base_dictionary_category
        expect(instance_dictionary_category).to eq(base_dictionary_category)
      end
    end
    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Dictionary::Category' do
          expect do
            post :create, dictionary_category: attributes_for(:dictionary_category)
          end.to change(Dictionary::Category, :count).by(1)
        end

        it 'assigns a newly created dictionary_category as @dictionary_category' do
          post :create, dictionary_category: attributes_for(:dictionary_category)
          expect(instance_dictionary_category).to be_a(Dictionary::Category)
          expect(instance_dictionary_category).to be_persisted
        end

        it 'redirects to the created dictionary_category' do
          post :create, dictionary_category: attributes_for(:dictionary_category)
          expect(response).to redirect_to(Dictionary::Category.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved dictionary_category as @dictionary_category' do
          post :create, dictionary_category: invalid_attributes
          expect(instance_dictionary_category).to be_a_new(Dictionary::Category)
        end

        it "re-renders the 'new' template" do
          post :create, dictionary_category: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        it 'assigns the requested dictionary_category as @dictionary_category' do
          put :update, id: static_dictionary_category, dictionary_category: valid_attributes
          static_dictionary_category.reload
          expect(instance_dictionary_category).to eq(static_dictionary_category)
        end

        it 'redirects to the dictionary_category' do
          put :update, id: static_dictionary_category, dictionary_category: valid_attributes
          expect(response).to redirect_to(static_dictionary_category)
        end
      end

      describe 'with invalid params' do
        it 'assigns the dictionary_category as @dictionary_category' do
          put :update, id: static_dictionary_category, dictionary_category: invalid_attributes
          expect(assigns(:dictionary_category)).to eq(static_dictionary_category)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_dictionary_category, dictionary_category: invalid_attributes
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested dictionary_category' do
        new_dictionary_category = create :dictionary_category
        expect do
          delete :destroy, id: new_dictionary_category
        end.to change(Dictionary::Category, :count).by(-1)
      end

      it 'redirects to the dictionary_category list' do
        delete :destroy, id: base_dictionary_category
        expect(response).to redirect_to(dictionary_categories_url)
      end
    end

  end
end
