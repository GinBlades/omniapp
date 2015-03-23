class Admin::Health::WorkoutCategoriesController < AdminController
  before_action :set_health_workout_category, only: [:show, :edit, :update, :destroy]

  def index
    @health_workout_categories = ::Health::WorkoutCategory.all
  end

  def show
  end

  def new
    @health_workout_category = ::Health::WorkoutCategory.new
  end

  def edit
  end

  def create
    @health_workout_category = ::Health::WorkoutCategory.new(health_workout_category_params)

    respond_to do |format|
      if @health_workout_category.save
        format.html { redirect_to [:admin,@health_workout_category], notice: 'Workout category was successfully created.' }
        format.json { render :show, status: :created, location: [:admin,@health_workout_category] }
      else
        format.html { render :new }
        format.json { render json: @health_workout_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @health_workout_category.update(health_workout_category_params)
        format.html { redirect_to [:admin,@health_workout_category], notice: 'Workout category was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin,@health_workout_category] }
      else
        format.html { render :edit }
        format.json { render json: @health_workout_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @health_workout_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_health_workout_categories_url, notice: 'Workout category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_health_workout_category
      @health_workout_category = ::Health::WorkoutCategory.find(params[:id])
    end

    def health_workout_category_params
      params.require(:health_workout_category).permit(:name)
    end
end
