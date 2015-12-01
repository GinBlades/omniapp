module Admin
  class Dog::EntriesController < AdminController
    before_action :set_dog_entry, only: [:show, :edit, :update, :destroy]

    # GET /dog/entries
    # GET /dog/entries.json
    def index
      @dog_entries = ::Dog::Entry.all
    end

    # GET /dog/entries/1
    # GET /dog/entries/1.json
    def show
    end

    # GET /dog/entries/new
    def new
      @dog_entry = ::Dog::Entry.new
    end

    # GET /dog/entries/1/edit
    def edit
    end

    # POST /dog/entries
    # POST /dog/entries.json
    def create
      @dog_entry = ::Dog::Entry.new(dog_entry_params)

      respond_to do |format|
        if @dog_entry.save
          format.html { redirect_to [:admin, @dog_entry], notice: 'Entry was successfully created.' }
          format.json { render :show, status: :created, location: [:admin, @dog_entry] }
        else
          format.html { render :new }
          format.json { render json: @dog_entry.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /dog/entries/1
    # PATCH/PUT /dog/entries/1.json
    def update
      respond_to do |format|
        if @dog_entry.update(dog_entry_params)
          format.html { redirect_to [:admin, @dog_entry], notice: 'Entry was successfully updated.' }
          format.json { render :show, status: :ok, location: [:admin, @dog_entry] }
        else
          format.html { render :edit }
          format.json { render json: @dog_entry.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /dog/entries/1
    # DELETE /dog/entries/1.json
    def destroy
      @dog_entry.destroy
      respond_to do |format|
        format.html { redirect_to admin_dog_entries_url, notice: 'Entry was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_dog_entry
        @dog_entry = ::Dog::Entry.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def dog_entry_params
        params.require(:dog_entry).permit(:entry_date, :notes)
      end
  end
end
