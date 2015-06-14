class Admin::Points::ActivitiesController < AdminController
  before_action :set_points_goal, except: [:index]
  before_action :set_points_option, except: [:index]
  before_action :set_points_activity, only: [:edit, :update, :destroy]

  def index
    @points_activities = ::Points::Activity.all
  end

  def new
    @points_activity = ::Points::Activity.new
  end

  def edit
  end

  def create
    @points_activity = if params[:option_id]
      @points_option.activities.build(points_activity_params)
    else
      ::Points::Activity.new(points_activity_params)
    end

    respond_to do |format|
      if @points_activity.save
        format.html { redirect_to admin_points_goal_url(@points_goal), notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: admin_points_goal_url(@points_goal) }
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

    def set_points_option
      @points_option = params[:option_id] ? ::Points::Option.find(params[:option_id]) : nil
    end

    def set_points_activity
      @points_activity = ::Points::Activity.find(params[:id])
    end

    def points_activity_params
      params.require(:points_activity).permit(:points_option_id, :entry_date, :note)
    end
end
