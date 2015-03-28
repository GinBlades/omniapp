class Admin::Health::MealsController < AdminController
  before_action :set_health_meal, only: [:show, :edit, :update, :destroy]

  def index
    @health_meals = ::Health::Meal.all
  end

  def show
  end

  def new
    @health_meal = ::Health::Meal.new
  end

  def edit
  end

  def create
    @health_meal = current_user.health_meals.build(health_meal_params)

    respond_to do |format|
      if @health_meal.save
        format.html { redirect_to [:admin,@health_meal], notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: [:admin,@health_meal] }
      else
        format.html { render :new }
        format.json { render json: @health_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @health_meal.update(health_meal_params)
        format.html { redirect_to [:admin,@health_meal], notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin,@health_meal] }
      else
        format.html { render :edit }
        format.json { render json: @health_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @health_meal.destroy
    respond_to do |format|
      format.html { redirect_to admin_health_meals_url, notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_health_meal
      @health_meal = ::Health::Meal.find(params[:id])
    end

    def health_meal_params
      params.require(:health_meal).permit(:time, :meal_category, :calories, :quality, :healthiness, :home, :vegetarian, :cost, :notes)
    end
end
