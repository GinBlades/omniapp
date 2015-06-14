require 'rails_helper'

RSpec.describe Points::ActivitiesController, type: :controller do
  describe 'Standard CRUD' do
    let(:instance_points_activity) { assigns(:points_activity) }
    let(:base_points_activity) { create(:points_activity) }
    let(:static_points_activity) { create(:points_activity, name: 'spec-points_activity') }
    let(:valid_attributes) { attributes_for(:points_activity, name: 'spec-points_activity') }
    let(:invalid_attributes) { attributes_for(:points_activity, name: nil) }
    describe 'GET #index' do
      it 'populates an array of all @points_activities' do
        second_points_activity = create :points_activity
        get :index
        expect(assigns(:points_activities)).to match_array([base_points_activity, second_points_activity])
      end
    end
    describe 'GET show' do
      it 'assigns the requested points_activity as @points_activity' do
        get :show, id: base_points_activity
        expect(instance_points_activity).to eq(base_points_activity)
      end
    end
    describe 'GET new' do
      it 'assigns a new points_activity as @points_activity' do
        get :new
        expect(instance_points_activity).to be_a_new(Points::Activity)
      end
    end
    describe 'GET edit' do
      it 'assigns the requested points_activity as @points_activity' do
        get :edit, id: base_points_activity
        expect(instance_points_activity).to eq(base_points_activity)
      end
    end
    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Points::Activity' do
          expect do
            post :create, points_activity: attributes_for(:points_activity)
          end.to change(Points::Activity, :count).by(1)
        end

        it 'assigns a newly created points_activity as @points_activity' do
          post :create, points_activity: attributes_for(:points_activity)
          expect(instance_points_activity).to be_a(Points::Activity)
          expect(instance_points_activity).to be_persisted
        end

        it 'redirects to the created points_activity' do
          post :create, points_activity: attributes_for(:points_activity)
          expect(response).to redirect_to(Points::Activity.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved points_activity as @points_activity' do
          post :create, points_activity: invalid_attributes
          expect(instance_points_activity).to be_a_new(Points::Activity)
        end

        it "re-renders the 'new' template" do
          post :create, points_activity: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        it 'assigns the requested points_activity as @points_activity' do
          put :update, id: static_points_activity, points_activity: valid_attributes
          static_points_activity.reload
          expect(instance_points_activity).to eq(static_points_activity)
        end

        it 'redirects to the points_activity' do
          put :update, id: static_points_activity, points_activity: valid_attributes
          expect(response).to redirect_to(static_points_activity)
        end
      end

      describe 'with invalid params' do
        it 'assigns the points_activity as @points_activity' do
          put :update, id: static_points_activity, points_activity: invalid_attributes
          expect(assigns(:points_activity)).to eq(static_points_activity)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_points_activity, points_activity: invalid_attributes
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested points_activity' do
        new_points_activity = create :points_activity
        expect do
          delete :destroy, id: new_points_activity
        end.to change(Points::Activity, :count).by(-1)
      end

      it 'redirects to the points_activity list' do
        delete :destroy, id: base_points_activity
        expect(response).to redirect_to(points_activities_url)
      end
    end
  end
end
