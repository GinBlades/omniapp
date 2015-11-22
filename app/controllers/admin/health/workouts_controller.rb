class Admin::Health::WorkoutsController < AdminController
  before_action :set_health_workout, only: [:show, :edit, :update, :destroy]

  def index
    @q = ::Health::Workout.includes(:user, :health_workout_category).ransack(params[:q])
    @health_workouts = @q.result(uniq: true)
  end

  def show
  end

  def new
    @health_workout = ::Health::Workout.new
  end

  def edit
  end

  def create
    @health_workout = current_user.health_workouts.build(health_workout_params)

    respond_to do |format|
      if @health_workout.save
        format.html { redirect_to [:admin, @health_workout], notice: "Workout was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @health_workout] }
      else
        format.html { render :new }
        format.json { render json: @health_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @health_workout.update(health_workout_params)
        format.html { redirect_to [:admin, @health_workout], notice: "Workout was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @health_workout] }
      else
        format.html { render :edit }
        format.json { render json: @health_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @health_workout.destroy
    respond_to do |format|
      format.html { redirect_to admin_health_workouts_url, notice: "Workout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_health_workout
      @health_workout = ::Health::Workout.find(params[:id])
    end

    def health_workout_params
      params.require(:health_workout).permit(:health_workout_category_id, :user_id, :start,
                                             :duration, :distance, :rating, :notes)
    end
end
