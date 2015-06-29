class Admin::Dictionary::LanguagesController < AdminController
  before_action :set_dictionary_language, only: [:show, :edit, :update, :destroy]

  def index
    @dictionary_languages = ::Dictionary::Language.all
  end

  def show
    @q = ::Dictionary::Entry.ransack(params[:q])
    @entries = @q.result(uniq: true).for_language(@dictionary_language).includes(:dictionary_category, :source, :target)
  end

  def new
    @dictionary_language = ::Dictionary::Language.new
  end

  def edit
  end

  def create
    @dictionary_language = ::Dictionary::Language.new(dictionary_language_params)

    respond_to do |format|
      if @dictionary_language.save
        format.html { redirect_to [:admin, @dictionary_language], notice: 'Language was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @dictionary_language] }
      else
        format.html { render :new }
        format.json { render json: @dictionary_language.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dictionary_language.update(dictionary_language_params)
        format.html { redirect_to [:admin, @dictionary_language], notice: 'Language was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @dictionary_language] }
      else
        format.html { render :edit }
        format.json { render json: @dictionary_language.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dictionary_language.destroy
    respond_to do |format|
      format.html { redirect_to admin_dictionary_languages_url, notice: 'Language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_dictionary_language
      @dictionary_language = ::Dictionary::Language.find(params[:id])
    end

    def dictionary_language_params
      params.require(:dictionary_language).permit(:name)
    end
end
