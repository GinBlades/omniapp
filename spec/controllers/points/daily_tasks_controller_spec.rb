require "rails_helper"

RSpec.describe Points::DailyTasksController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_points_daily_task) { assigns(:points_daily_task) }
    let(:base_points_daily_task) { create(:points_daily_task) }
    let(:static_points_daily_task) { create(:points_daily_task, name: "spec-points_daily_task") }
    let(:valid_attributes) { attributes_for(:points_daily_task, name: "spec-points_daily_task") }
    let(:invalid_attributes) { attributes_for(:points_daily_task, name: nil) }
    describe "GET #index" do
      it "populates an array of all @points_daily_tasks" do
        second_points_daily_task = create :points_daily_task
        get :index
        expect(assigns(:points_daily_tasks)).to match_array([base_points_daily_task, second_points_daily_task])
      end
    end
    describe "GET show" do
      it "assigns the requested points_daily_task as @points_daily_task" do
        get :show, id: base_points_daily_task
        expect(instance_points_daily_task).to eq(base_points_daily_task)
      end
    end
    describe "GET new" do
      it "assigns a new points_daily_task as @points_daily_task" do
        get :new
        expect(instance_points_daily_task).to be_a_new(Points::DailyTask)
      end
    end
    describe "GET edit" do
      it "assigns the requested points_daily_task as @points_daily_task" do
        get :edit, id: base_points_daily_task
        expect(instance_points_daily_task).to eq(base_points_daily_task)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Points::DailyTask" do
          expect do
            post :create, points_daily_task: attributes_for(:points_daily_task)
          end.to change(Points::DailyTask, :count).by(1)
        end

        it "assigns a newly created points_daily_task as @points_daily_task" do
          post :create, points_daily_task: attributes_for(:points_daily_task)
          expect(instance_points_daily_task).to be_a(Points::DailyTask)
          expect(instance_points_daily_task).to be_persisted
        end

        it "redirects to the created points_daily_task" do
          post :create, points_daily_task: attributes_for(:points_daily_task)
          expect(response).to redirect_to(Points::DailyTask.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved points_daily_task as @points_daily_task" do
          post :create, points_daily_task: invalid_attributes
          expect(instance_points_daily_task).to be_a_new(Points::DailyTask)
        end

        it "re-renders the 'new' template" do
          post :create, points_daily_task: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested points_daily_task as @points_daily_task" do
          put :update, id: static_points_daily_task, points_daily_task: valid_attributes
          static_points_daily_task.reload
          expect(instance_points_daily_task).to eq(static_points_daily_task)
        end

        it "redirects to the points_daily_task" do
          put :update, id: static_points_daily_task, points_daily_task: valid_attributes
          expect(response).to redirect_to(static_points_daily_task)
        end
      end

      describe "with invalid params" do
        it "assigns the points_daily_task as @points_daily_task" do
          put :update, id: static_points_daily_task, points_daily_task: invalid_attributes
          expect(assigns(:points_daily_task)).to eq(static_points_daily_task)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_points_daily_task, points_daily_task: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested points_daily_task" do
        new_points_daily_task = create :points_daily_task
        expect do
          delete :destroy, id: new_points_daily_task
        end.to change(Points::DailyTask, :count).by(-1)
      end

      it "redirects to the points_daily_task list" do
        delete :destroy, id: base_points_daily_task
        expect(response).to redirect_to(points_daily_tasks_url)
      end
    end
  end
end
