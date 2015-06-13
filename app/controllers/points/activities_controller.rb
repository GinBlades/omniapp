class Points::ActivitiesController < ApplicationController
  before_action :set_points_activity, only: [:show, :edit, :update, :destroy]

  def index
    @points_activities = Points::Activity.all
  end

  def show
  end

  def new
    @points_activity = Points::Activity.new
  end

  def edit
  end

  def create
    @points_activity = Points::Activity.new(points_activity_params)

    respond_to do |format|
      if @points_activity.save
        format.html { redirect_to @points_activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @points_activity }
      else
        format.html { render :new }
        format.json { render json: @points_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @points_activity.update(points_activity_params)
        format.html { redirect_to @points_activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @points_activity }
      else
        format.html { render :edit }
        format.json { render json: @points_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @points_activity.destroy
    respond_to do |format|
      format.html { redirect_to points_activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_points_activity
      @points_activity = Points::Activity.find(params[:id])
    end

    def points_activity_params
      params.require(:points_activity).permit(:points_option_id, :entry_date, :note)
    end
end
