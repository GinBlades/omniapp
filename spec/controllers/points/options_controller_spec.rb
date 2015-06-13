require 'rails_helper'

RSpec.describe Points::OptionsController, type: :controller do

  
  describe 'Standard CRUD' do
    let(:instance_points_option) { assigns(:points_option) }
    let(:base_points_option) { create(:points_option) }
    let(:static_points_option) { create(:points_option, name: 'spec-points_option') }
    let(:valid_attributes) { attributes_for(:points_option, name: 'spec-points_option') }
    let(:invalid_attributes) { attributes_for(:points_option, name: nil) }
    describe 'GET #index' do
      it 'populates an array of all @points_options' do
        second_points_option = create :points_option
        get :index
        expect(assigns(:points_options)).to match_array([base_points_option, second_points_option])
      end
    end
    describe 'GET show' do
      it 'assigns the requested points_option as @points_option' do
        get :show, id: base_points_option
        expect(instance_points_option).to eq(base_points_option)
      end
    end
    describe 'GET new' do
      it 'assigns a new points_option as @points_option' do
        get :new
        expect(instance_points_option).to be_a_new(Points::Option)
      end
    end
    describe 'GET edit' do
      it 'assigns the requested points_option as @points_option' do
        get :edit, id: base_points_option
        expect(instance_points_option).to eq(base_points_option)
      end
    end
    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Points::Option' do
          expect do
            post :create, points_option: attributes_for(:points_option)
          end.to change(Points::Option, :count).by(1)
        end

        it 'assigns a newly created points_option as @points_option' do
          post :create, points_option: attributes_for(:points_option)
          expect(instance_points_option).to be_a(Points::Option)
          expect(instance_points_option).to be_persisted
        end

        it 'redirects to the created points_option' do
          post :create, points_option: attributes_for(:points_option)
          expect(response).to redirect_to(Points::Option.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved points_option as @points_option' do
          post :create, points_option: invalid_attributes
          expect(instance_points_option).to be_a_new(Points::Option)
        end

        it "re-renders the 'new' template" do
          post :create, points_option: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        it 'assigns the requested points_option as @points_option' do
          put :update, id: static_points_option, points_option: valid_attributes
          static_points_option.reload
          expect(instance_points_option).to eq(static_points_option)
        end

        it 'redirects to the points_option' do
          put :update, id: static_points_option, points_option: valid_attributes
          expect(response).to redirect_to(static_points_option)
        end
      end

      describe 'with invalid params' do
        it 'assigns the points_option as @points_option' do
          put :update, id: static_points_option, points_option: invalid_attributes
          expect(assigns(:points_option)).to eq(static_points_option)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_points_option, points_option: invalid_attributes
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested points_option' do
        new_points_option = create :points_option
        expect do
          delete :destroy, id: new_points_option
        end.to change(Points::Option, :count).by(-1)
      end

      it 'redirects to the points_option list' do
        delete :destroy, id: base_points_option
        expect(response).to redirect_to(points_options_url)
      end
    end

  end
end
