class Admin::Health::RatingsController < AdminController
  before_action :set_health_rating, only: [:show, :edit, :update, :destroy]

  def index
    @health_ratings = ::Health::Rating.all
  end

  def show
  end

  def new
    @health_rating = ::Health::Rating.new
  end

  def edit
  end

  def create
    @health_rating = ::Health::Rating.new(health_rating_params)

    respond_to do |format|
      if @health_rating.save
        format.html { redirect_to [:admin,@health_rating], notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: [:admin,@health_rating] }
      else
        format.html { render :new }
        format.json { render json: @health_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @health_rating.update(health_rating_params)
        format.html { redirect_to [:admin,@health_rating], notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin,@health_rating] }
      else
        format.html { render :edit }
        format.json { render json: @health_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @health_rating.destroy
    respond_to do |format|
      format.html { redirect_to admin_health_ratings_url, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_health_rating
      @health_rating = ::Health::Rating.find(params[:id])
    end

    def health_rating_params
      params.require(:health_rating).permit(:health_category_id, :health_entry_id)
    end
end
