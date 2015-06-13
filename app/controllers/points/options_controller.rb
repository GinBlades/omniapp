class Points::OptionsController < ApplicationController
  before_action :set_points_option, only: [:show, :edit, :update, :destroy]

  def index
    @points_options = Points::Option.all
  end

  def show
  end

  def new
    @points_option = Points::Option.new
  end

  def edit
  end

  def create
    @points_option = Points::Option.new(points_option_params)

    respond_to do |format|
      if @points_option.save
        format.html { redirect_to @points_option, notice: 'Option was successfully created.' }
        format.json { render :show, status: :created, location: @points_option }
      else
        format.html { render :new }
        format.json { render json: @points_option.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @points_option.update(points_option_params)
        format.html { redirect_to @points_option, notice: 'Option was successfully updated.' }
        format.json { render :show, status: :ok, location: @points_option }
      else
        format.html { render :edit }
        format.json { render json: @points_option.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @points_option.destroy
    respond_to do |format|
      format.html { redirect_to points_options_url, notice: 'Option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_points_option
      @points_option = Points::Option.find(params[:id])
    end

    def points_option_params
      params.require(:points_option).permit(:points_goal_id, :description, :points)
    end
end
