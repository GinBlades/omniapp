class Notes::CategoriesController < ApplicationController
  before_action :set_notes_category, only: [:show, :edit, :update, :destroy]

  # GET /notes/categories
  # GET /notes/categories.json
  def index
    @notes_categories = Notes::Category.all
  end

  # GET /notes/categories/1
  # GET /notes/categories/1.json
  def show
  end

  # GET /notes/categories/new
  def new
    @notes_category = Notes::Category.new
  end

  # GET /notes/categories/1/edit
  def edit
  end

  # POST /notes/categories
  # POST /notes/categories.json
  def create
    @notes_category = Notes::Category.new(notes_category_params)

    respond_to do |format|
      if @notes_category.save
        format.html { redirect_to @notes_category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @notes_category }
      else
        format.html { render :new }
        format.json { render json: @notes_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/categories/1
  # PATCH/PUT /notes/categories/1.json
  def update
    respond_to do |format|
      if @notes_category.update(notes_category_params)
        format.html { redirect_to @notes_category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @notes_category }
      else
        format.html { render :edit }
        format.json { render json: @notes_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/categories/1
  # DELETE /notes/categories/1.json
  def destroy
    @notes_category.destroy
    respond_to do |format|
      format.html { redirect_to notes_categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notes_category
      @notes_category = Notes::Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notes_category_params
      params.require(:notes_category).permit(:name, :slug)
    end
end
