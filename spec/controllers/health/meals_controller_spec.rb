require "rails_helper"

RSpec.describe Health::MealsController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_health_meal) { assigns(:health_meal) }
    let(:base_health_meal) { create(:health_meal) }
    let(:static_health_meal) { create(:health_meal, name: "spec-health_meal") }
    let(:valid_attributes) { attributes_for(:health_meal, name: "spec-health_meal") }
    let(:invalid_attributes) { attributes_for(:health_meal, name: nil) }
    describe "GET #index" do
      it "populates an array of all @health_meals" do
        second_health_meal = create :health_meal
        get :index
        expect(assigns(:health_meals)).to match_array([base_health_meal, second_health_meal])
      end
    end
    describe "GET show" do
      it "assigns the requested health_meal as @health_meal" do
        get :show, id: base_health_meal
        expect(instance_health_meal).to eq(base_health_meal)
      end
    end
    describe "GET new" do
      it "assigns a new health_meal as @health_meal" do
        get :new
        expect(instance_health_meal).to be_a_new(Health::Meal)
      end
    end
    describe "GET edit" do
      it "assigns the requested health_meal as @health_meal" do
        get :edit, id: base_health_meal
        expect(instance_health_meal).to eq(base_health_meal)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Health::Meal" do
          expect do
            post :create, health_meal: attributes_for(:health_meal)
          end.to change(Health::Meal, :count).by(1)
        end

        it "assigns a newly created health_meal as @health_meal" do
          post :create, health_meal: attributes_for(:health_meal)
          expect(instance_health_meal).to be_a(Health::Meal)
          expect(instance_health_meal).to be_persisted
        end

        it "redirects to the created health_meal" do
          post :create, health_meal: attributes_for(:health_meal)
          expect(response).to redirect_to(Health::Meal.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved health_meal as @health_meal" do
          post :create, health_meal: invalid_attributes
          expect(instance_health_meal).to be_a_new(Health::Meal)
        end

        it "re-renders the 'new' template" do
          post :create, health_meal: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested health_meal as @health_meal" do
          put :update, id: static_health_meal, health_meal: valid_attributes
          static_health_meal.reload
          expect(instance_health_meal).to eq(static_health_meal)
        end

        it "redirects to the health_meal" do
          put :update, id: static_health_meal, health_meal: valid_attributes
          expect(response).to redirect_to(static_health_meal)
        end
      end

      describe "with invalid params" do
        it "assigns the health_meal as @health_meal" do
          put :update, id: static_health_meal, health_meal: invalid_attributes
          expect(assigns(:health_meal)).to eq(static_health_meal)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_health_meal, health_meal: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested health_meal" do
        new_health_meal = create :health_meal
        expect do
          delete :destroy, id: new_health_meal
        end.to change(Health::Meal, :count).by(-1)
      end

      it "redirects to the health_meal list" do
        delete :destroy, id: base_health_meal
        expect(response).to redirect_to(health_meals_url)
      end
    end
  end
end
