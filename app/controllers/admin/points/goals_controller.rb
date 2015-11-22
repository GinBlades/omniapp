class Admin::Points::GoalsController < AdminController
  before_action :set_points_goal, only: [:show, :edit, :update, :destroy]

  def index
    @points_goals = ::Points::Goal.all
  end

  def show
  end

  def new
    @points_goal = current_user.points_goals.build
  end

  def edit
  end

  def create
    @points_goal = current_user.points_goals.build(points_goal_params)

    respond_to do |format|
      if @points_goal.save
        format.html { redirect_to [:admin, @points_goal], notice: "Goal was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @points_goal] }
      else
        format.html { render :new }
        format.json { render json: @points_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @points_goal.update(points_goal_params)
        format.html { redirect_to [:admin, @points_goal], notice: "Goal was successfully updated." }
        format.json { render :show, status: :ok, location: @points_goal }
      else
        format.html { render :edit }
        format.json { render json: @points_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @points_goal.destroy
    respond_to do |format|
      format.html { redirect_to admin_points_goals_url, notice: "Goal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_points_goal
      @points_goal = ::Points::Goal.find(params[:id])
    end

    def points_goal_params
      params.require(:points_goal).permit(:target, :expiration, :completed,
                                          :current_points, :points_to_complete, :reward)
    end
end
