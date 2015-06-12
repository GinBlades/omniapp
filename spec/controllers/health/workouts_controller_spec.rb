require 'rails_helper'

RSpec.describe Health::WorkoutsController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_health_workout) { assigns(:health_workout) }
    let(:base_health_workout) { create(:health_workout) }
    let(:static_health_workout) { create(:health_workout, name: 'spec-health_workout') }
    let(:valid_attributes) { attributes_for(:health_workout, name: 'spec-health_workout') }
    let(:invalid_attributes) { attributes_for(:health_workout, name: nil) }
    describe "GET #index" do
      it "populates an array of all @health_workouts" do
        second_health_workout = create :health_workout
        get :index
        expect(assigns(:health_workouts)).to match_array([base_health_workout, second_health_workout])
      end
    end
    describe "GET show" do
      it "assigns the requested health_workout as @health_workout" do
        get :show, id: base_health_workout
        expect(instance_health_workout).to eq(base_health_workout)
      end
    end
    describe "GET new" do
      it "assigns a new health_workout as @health_workout" do
        get :new
        expect(instance_health_workout).to be_a_new(Health::Workout)
      end
    end
    describe "GET edit" do
      it "assigns the requested health_workout as @health_workout" do
        get :edit, id: base_health_workout
        expect(instance_health_workout).to eq(base_health_workout)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Health::Workout" do
          expect do
            post :create, health_workout: attributes_for(:health_workout)
          end.to change(Health::Workout, :count).by(1)
        end

        it "assigns a newly created health_workout as @health_workout" do
          post :create, health_workout: attributes_for(:health_workout)
          expect(instance_health_workout).to be_a(Health::Workout)
          expect(instance_health_workout).to be_persisted
        end

        it "redirects to the created health_workout" do
          post :create, health_workout: attributes_for(:health_workout)
          expect(response).to redirect_to(Health::Workout.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved health_workout as @health_workout" do
          post :create, health_workout: invalid_attributes
          expect(instance_health_workout).to be_a_new(Health::Workout)
        end

        it "re-renders the 'new' template" do
          post :create, health_workout: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested health_workout as @health_workout" do
          put :update, id: static_health_workout, health_workout: valid_attributes
          static_health_workout.reload
          expect(instance_health_workout).to eq(static_health_workout)
        end

        it "redirects to the health_workout" do
          put :update, id: static_health_workout, health_workout: valid_attributes
          expect(response).to redirect_to(static_health_workout)
        end
      end

      describe "with invalid params" do
        it "assigns the health_workout as @health_workout" do
          put :update, id: static_health_workout, health_workout: invalid_attributes
          expect(assigns(:health_workout)).to eq(static_health_workout)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_health_workout, health_workout: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested health_workout" do
        new_health_workout = create :health_workout
        expect do
          delete :destroy, id: new_health_workout
        end.to change(Health::Workout, :count).by(-1)
      end

      it "redirects to the health_workout list" do
        delete :destroy, id: base_health_workout
        expect(response).to redirect_to(health_workouts_url)
      end
    end
  end
end
