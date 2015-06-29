class Admin::Dictionary::EntriesController < AdminController
  before_action :set_dictionary_entry, only: [:show, :edit, :update, :destroy]

  def index
    @dictionary_entries = ::Dictionary::Entry.all
  end

  def show
  end

  def new
    @dictionary_entry = ::Dictionary::Entry.new
    @last_entry = current_user.dictionary_entries.order(created_at: :desc).first
  end

  def edit
  end

  def create
    @dictionary_entry = current_user.dictionary_entries.build(dictionary_entry_params)

    respond_to do |format|
      if @dictionary_entry.save
        format.html { redirect_to [:admin, @dictionary_entry], notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @dictionary_entry] }
      else
        format.html { render :new }
        format.json { render json: @dictionary_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dictionary_entry.update(dictionary_entry_params)
        format.html { redirect_to [:admin, @dictionary_entry], notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @dictionary_entry] }
      else
        format.html { render :edit }
        format.json { render json: @dictionary_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dictionary_entry.destroy
    respond_to do |format|
      format.html { redirect_to admin_dictionary_entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_dictionary_entry
      @dictionary_entry = ::Dictionary::Entry.find(params[:id])
    end

    def dictionary_entry_params
      params.require(:dictionary_entry).permit(:source_id, :target_id, :dictionary_category_id, :definition, :examples, :word, :notes)
    end
end
