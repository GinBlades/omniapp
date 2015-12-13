module Admin
  class Dog::EntriesController < AdminController
    before_action :set_dog_entry, only: [:show, :edit, :update, :destroy]

    def index
      @dog_entries = ::Dog::Entry.paginate(page: params[:page], per_page: 10)
    end

    def show
    end

    def new
      @dog_entry = ::Dog::Entry.new
    end

    def edit
    end

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

    def destroy
      @dog_entry.destroy
      respond_to do |format|
        format.html { redirect_to admin_dog_entries_url, notice: 'Entry was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      def set_dog_entry
        @dog_entry = ::Dog::Entry.find(params[:id])
      end

      def dog_entry_params
        params.require(:dog_entry).permit(:entry_date, :notes)
      end
  end
end
