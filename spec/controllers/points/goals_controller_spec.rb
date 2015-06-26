require "rails_helper"

RSpec.describe Points::GoalsController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_points_goal) { assigns(:points_goal) }
    let(:base_points_goal) { create(:points_goal) }
    let(:static_points_goal) { create(:points_goal, name: "spec-points_goal") }
    let(:valid_attributes) { attributes_for(:points_goal, name: "spec-points_goal") }
    let(:invalid_attributes) { attributes_for(:points_goal, name: nil) }
    describe "GET #index" do
      it "populates an array of all @points_goals" do
        second_points_goal = create :points_goal
        get :index
        expect(assigns(:points_goals)).to match_array([base_points_goal, second_points_goal])
      end
    end
    describe "GET show" do
      it "assigns the requested points_goal as @points_goal" do
        get :show, id: base_points_goal
        expect(instance_points_goal).to eq(base_points_goal)
      end
    end
    describe "GET new" do
      it "assigns a new points_goal as @points_goal" do
        get :new
        expect(instance_points_goal).to be_a_new(Points::Goal)
      end
    end
    describe "GET edit" do
      it "assigns the requested points_goal as @points_goal" do
        get :edit, id: base_points_goal
        expect(instance_points_goal).to eq(base_points_goal)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Points::Goal" do
          expect do
            post :create, points_goal: attributes_for(:points_goal)
          end.to change(Points::Goal, :count).by(1)
        end

        it "assigns a newly created points_goal as @points_goal" do
          post :create, points_goal: attributes_for(:points_goal)
          expect(instance_points_goal).to be_a(Points::Goal)
          expect(instance_points_goal).to be_persisted
        end

        it "redirects to the created points_goal" do
          post :create, points_goal: attributes_for(:points_goal)
          expect(response).to redirect_to(Points::Goal.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved points_goal as @points_goal" do
          post :create, points_goal: invalid_attributes
          expect(instance_points_goal).to be_a_new(Points::Goal)
        end

        it "re-renders the 'new' template" do
          post :create, points_goal: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested points_goal as @points_goal" do
          put :update, id: static_points_goal, points_goal: valid_attributes
          static_points_goal.reload
          expect(instance_points_goal).to eq(static_points_goal)
        end

        it "redirects to the points_goal" do
          put :update, id: static_points_goal, points_goal: valid_attributes
          expect(response).to redirect_to(static_points_goal)
        end
      end

      describe "with invalid params" do
        it "assigns the points_goal as @points_goal" do
          put :update, id: static_points_goal, points_goal: invalid_attributes
          expect(assigns(:points_goal)).to eq(static_points_goal)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_points_goal, points_goal: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested points_goal" do
        new_points_goal = create :points_goal
        expect do
          delete :destroy, id: new_points_goal
        end.to change(Points::Goal, :count).by(-1)
      end

      it "redirects to the points_goal list" do
        delete :destroy, id: base_points_goal
        expect(response).to redirect_to(points_goals_url)
      end
    end
  end
end
