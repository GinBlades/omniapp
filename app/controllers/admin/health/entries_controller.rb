class Admin::Health::EntriesController < AdminController
  before_action :set_health_entry, only: [:show, :edit, :update, :destroy]

  def index
    @health_entries = ::Health::Entry.all
  end

  def show
  end

  def new
    @health_entry = ::Health::Entry.new
  end

  def edit
  end

  def create
    @health_entry = current_user.health_entries.build(health_entry_params)

    respond_to do |format|
      if @health_entry.save
        format.html { redirect_to [:admin,@health_entry], notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: [:admin,@health_entry] }
      else
        format.html { render :new }
        format.json { render json: @health_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @health_entry.update(health_entry_params)
        format.html { redirect_to [:admin,@health_entry], notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin,@health_entry] }
      else
        format.html { render :edit }
        format.json { render json: @health_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @health_entry.destroy
    respond_to do |format|
      format.html { redirect_to admin_health_entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_health_entry
      @health_entry = ::Health::Entry.find(params[:id])
    end

    def health_entry_params
      params.require(:health_entry).permit(:entry_date, :notes)
    end
end
