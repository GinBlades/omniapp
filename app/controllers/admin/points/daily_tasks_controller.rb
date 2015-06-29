class Admin::Points::DailyTasksController < AdminController
  before_action :set_points_daily_task, only: [:show, :edit, :update, :destroy, :task_update]

  def index
    @points_daily_tasks = ::Points::DailyTask.order(entry_date: :desc)
  end

  def show
  end

  def new
    @points_daily_task = ::Points::DailyTask.new
  end

  def edit
  end

  def create
    @points_daily_task = current_user.points_daily_tasks.build(points_daily_task_params)

    respond_to do |format|
      if @points_daily_task.save
        format.html { redirect_to [:admin, @points_daily_task], notice: "Daily task was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @points_daily_task] }
      else
        format.html { render :new }
        format.json { render json: @points_daily_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @points_daily_task.update(points_daily_task_params)
        format.html { redirect_to [:admin, @points_daily_task], notice: "Daily task was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @points_daily_task] }
      else
        format.html { render :edit }
        format.json { render json: @points_daily_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @points_daily_task.destroy
    respond_to do |format|
      format.html { redirect_to admin_points_daily_tasks_url, notice: "Daily task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def task_update
    task = params[:task]
    i = @points_daily_task.clear_tasks.index(task)
    completed = params[:completed] == "true" ? true : false
    @points_daily_task.tasks[i] = ::Points::DailyTask.update_task(task, completed)
    if @points_daily_task.save
      render json: @points_daily_task.success, status: :ok
    else
      render json: @points_daily_task.errors, status: :unprocessable_entity
    end
  end

  private

  def set_points_daily_task
    @points_daily_task = ::Points::DailyTask.find(params[:id])
  end

  def points_daily_task_params
    params.require(:points_daily_task).permit(:entry_date, :task_string)
  end
end
