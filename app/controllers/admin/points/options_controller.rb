class Admin::Points::OptionsController < AdminController
  before_action :set_points_goal
  before_action :set_points_option, only: [:edit, :update, :destroy, :quick_entry]

  def new
    @points_option = @points_goal.points_options.build
    @form_path = admin_points_goal_options_path(@points_goal)
  end

  def edit
    @form_path = admin_points_goal_option_path(@points_goal, @points_option)
  end

  def create
    @points_option = @points_goal.points_options.build(points_option_params)

    respond_to do |format|
      if @points_option.save
        format.html { redirect_to admin_points_goal_url(@points_goal), notice: 'Option was successfully created.' }
        format.json { render :show, status: :created, location: admin_points_goal_url(@points_goal) }
      else
        format.html { render :new }
        format.json { render json: @points_option.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @points_option.update(points_option_params)
        format.html { redirect_to admin_points_goal_url(@points_goal), notice: 'Option was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_points_goal_url(@points_goal) }
      else
        format.html { render :edit }
        format.json { render json: @points_option.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @points_option.destroy
    respond_to do |format|
      format.html { redirect_to admin_points_goal_url(@points_goal), notice: 'Option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def quick_entry
    @points_option.points_activities.create(entry_date: Time.zone.today)
    redirect_to admin_points_goal_url(@points_goal)
  end

  private

  def set_points_goal
    @points_goal = ::Points::Goal.find(params[:goal_id])
  end

  def set_points_option
    @points_option = ::Points::Option.find(params[:id])
  end

  def points_option_params
    params.require(:points_option).permit(:description, :points)
  end
end
