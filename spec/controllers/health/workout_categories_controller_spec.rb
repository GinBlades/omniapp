require 'rails_helper'

RSpec.describe Health::WorkoutCategoriesController, type: :controller do

  
  describe "Standard CRUD" do
    let(:instance_health_workout_category) { assigns(:health_workout_category) }
    let(:base_health_workout_category) { create(:health_workout_category) }
    let(:static_health_workout_category) { create(:health_workout_category, name: 'spec-health_workout_category') }
    let(:valid_attributes) { attributes_for(:health_workout_category, name: 'spec-health_workout_category') }
    let(:invalid_attributes) { attributes_for(:health_workout_category, name: nil) }
    describe "GET #index" do
      it "populates an array of all @health_workout_categories" do
        second_health_workout_category = create :health_workout_category
        get :index
        expect(assigns(:health_workout_categories)).to match_array([base_health_workout_category, second_health_workout_category])
      end
    end
    describe "GET show" do
      it "assigns the requested health_workout_category as @health_workout_category" do
        get :show, id: base_health_workout_category
        expect(instance_health_workout_category).to eq(base_health_workout_category)
      end
    end
    describe "GET new" do
      it "assigns a new health_workout_category as @health_workout_category" do
        get :new
        expect(instance_health_workout_category).to be_a_new(Health::WorkoutCategory)
      end
    end
    describe "GET edit" do
      it "assigns the requested health_workout_category as @health_workout_category" do
        get :edit, id: base_health_workout_category
        expect(instance_health_workout_category).to eq(base_health_workout_category)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Health::WorkoutCategory" do
          expect {
            post :create, health_workout_category: attributes_for(:health_workout_category)
          }.to change(Health::WorkoutCategory, :count).by(1)
        end

        it "assigns a newly created health_workout_category as @health_workout_category" do
          post :create, health_workout_category: attributes_for(:health_workout_category)
          expect(instance_health_workout_category).to be_a(Health::WorkoutCategory)
          expect(instance_health_workout_category).to be_persisted
        end

        it "redirects to the created health_workout_category" do
          post :create, health_workout_category: attributes_for(:health_workout_category)
          expect(response).to redirect_to(Health::WorkoutCategory.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved health_workout_category as @health_workout_category" do
          post :create, health_workout_category: invalid_attributes
          expect(instance_health_workout_category).to be_a_new(Health::WorkoutCategory)
        end

        it "re-renders the 'new' template" do
          post :create, health_workout_category: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested health_workout_category as @health_workout_category" do
          put :update, id: static_health_workout_category, health_workout_category: valid_attributes
          static_health_workout_category.reload
          expect(instance_health_workout_category).to eq(static_health_workout_category)
        end

        it "redirects to the health_workout_category" do
          put :update, id: static_health_workout_category, health_workout_category: valid_attributes
          expect(response).to redirect_to(static_health_workout_category)
        end
      end

      describe "with invalid params" do
        it "assigns the health_workout_category as @health_workout_category" do
          put :update, id: static_health_workout_category, health_workout_category: invalid_attributes
          expect(assigns(:health_workout_category)).to eq(static_health_workout_category)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_health_workout_category, health_workout_category: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested health_workout_category" do
        new_health_workout_category = create :health_workout_category
        expect {
          delete :destroy, id: new_health_workout_category
        }.to change(Health::WorkoutCategory, :count).by(-1)
      end

      it "redirects to the health_workout_category list" do
        delete :destroy, id: base_health_workout_category
        expect(response).to redirect_to(health_workout_categories_url)
      end
    end

  end
end
