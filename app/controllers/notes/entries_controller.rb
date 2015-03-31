class Notes::EntriesController < ApplicationController
  before_action :set_notes_entry, only: [:show, :edit, :update, :destroy]

  # GET /notes/entries
  # GET /notes/entries.json
  def index
    @notes_entries = Notes::Entry.all
  end

  # GET /notes/entries/1
  # GET /notes/entries/1.json
  def show
  end

  # GET /notes/entries/new
  def new
    @notes_entry = Notes::Entry.new
  end

  # GET /notes/entries/1/edit
  def edit
  end

  # POST /notes/entries
  # POST /notes/entries.json
  def create
    @notes_entry = Notes::Entry.new(notes_entry_params)

    respond_to do |format|
      if @notes_entry.save
        format.html { redirect_to @notes_entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @notes_entry }
      else
        format.html { render :new }
        format.json { render json: @notes_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/entries/1
  # PATCH/PUT /notes/entries/1.json
  def update
    respond_to do |format|
      if @notes_entry.update(notes_entry_params)
        format.html { redirect_to @notes_entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @notes_entry }
      else
        format.html { render :edit }
        format.json { render json: @notes_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/entries/1
  # DELETE /notes/entries/1.json
  def destroy
    @notes_entry.destroy
    respond_to do |format|
      format.html { redirect_to notes_entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notes_entry
      @notes_entry = Notes::Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notes_entry_params
      params.require(:notes_entry).permit(:name, :slug, :body, :notes_category_id)
    end
end
