class Admin::Points::ActivitiesController < AdminController
  before_action :set_points_goal, except: [:index]
  before_action :set_points_activity, only: [:edit, :update, :destroy]

  def index
    @points_activities = ::Points::Activity.all
  end

  def new
    @points_activity = ::Points::Activity.new
    @form_path = @points_goal ? admin_points_goal_activities_path(@points_goal) : admin_points_activities_path
  end

  def edit
    @form_path = admin_points_goal_activity_path(@points_goal, @points_activity)
  end

  def create
    @points_activity = new_activity(params[:goal])

    respond_to do |format|
      if @points_activity.save
        format.html { redirect_to admin_points_goal_url(@points_activity.direct_goal), notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: admin_points_goal_url(@points_activity.direct_goal) }
      else
        format.html { render :new }
        format.json { render json: @points_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @points_activity.update(points_activity_params)
        format.html { redirect_to admin_points_goal_url(@points_goal), notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_points_goal_url(@points_goal) }
      else
        format.html { render :edit }
        format.json { render json: @points_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @points_activity.destroy
    respond_to do |format|
      format.html { redirect_to admin_points_goal_url(@points_goal), notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_points_goal
    @points_goal = params[:goal_id] ? ::Points::Goal.find(params[:goal_id]) : nil
  end

  def new_activity(goal_id)
    if goal_id
      ::Points::Goal.find(goal_id).points_activities.build(points_activity_params)
    else
      ::Points::Activity.new(points_activity_params)
    end
  end

  def set_points_activity
    @points_activity = ::Points::Activity.find(params[:id])
  end

  def points_activity_params
    params.require(:points_activity).permit(:points_goal_id, :points_option_id, :entry_date, :note)
  end
end
