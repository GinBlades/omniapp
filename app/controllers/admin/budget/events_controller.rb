class Admin::Budget::EventsController < AdminController
  before_action :set_budget_event, only: [:show, :edit, :update, :destroy]

  def index
    @budget_events = ::Budget::Event.all
  end

  def show
  end

  def new
    @budget_event = ::Budget::Event.new
  end

  def edit
  end

  def create
    @budget_event = ::Budget::Event.new(budget_event_params)

    respond_to do |format|
      if @budget_event.save
        format.html { redirect_to [:admin,@budget_event], notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: [:admin,@budget_event] }
      else
        format.html { render :new }
        format.json { render json: @budget_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @budget_event.update(budget_event_params)
        format.html { redirect_to [:admin,@budget_event], notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin,@budget_event] }
      else
        format.html { render :edit }
        format.json { render json: @budget_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @budget_event.destroy
    respond_to do |format|
      format.html { redirect_to admin_budget_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_budget_event
      @budget_event = ::Budget::Event.find(params[:id])
    end

    def budget_event_params
      params.require(:budget_event).permit(:budget_payee_id, :event_date, :price, :recurring, :event_action, :url, :alert_date, :alert_before, :recurring_interval)
    end
end
