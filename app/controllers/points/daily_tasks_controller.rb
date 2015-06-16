class Points::DailyTasksController < ApplicationController
  before_action :set_points_daily_task, only: [:show, :edit, :update, :destroy]

  def index
    @points_daily_tasks = Points::DailyTask.all
  end

  def show
  end

  def new
    @points_daily_task = Points::DailyTask.new
  end

  def edit
  end

  def create
    @points_daily_task = Points::DailyTask.new(points_daily_task_params)

    respond_to do |format|
      if @points_daily_task.save
        format.html { redirect_to @points_daily_task, notice: 'Daily task was successfully created.' }
        format.json { render :show, status: :created, location: @points_daily_task }
      else
        format.html { render :new }
        format.json { render json: @points_daily_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @points_daily_task.update(points_daily_task_params)
        format.html { redirect_to @points_daily_task, notice: 'Daily task was successfully updated.' }
        format.json { render :show, status: :ok, location: @points_daily_task }
      else
        format.html { render :edit }
        format.json { render json: @points_daily_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @points_daily_task.destroy
    respond_to do |format|
      format.html { redirect_to points_daily_tasks_url, notice: 'Daily task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_points_daily_task
      @points_daily_task = Points::DailyTask.find(params[:id])
    end

    def points_daily_task_params
      params.require(:points_daily_task).permit(:entry_date, :task_string)
    end
end
