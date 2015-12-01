module Admin
  class Allowance::EntriesController < ApplicationController
    before_action :set_allowance_entry, only: [:show, :edit, :update, :destroy]

    def index
      @q = ::Allowance::Entry.ransack(params[:q])
      @allowance_entries = @q.result(uniq: true).where(user: current_user)
    end

    def show
    end

    def new
      @allowance_entry = current_user.allowance_entries.build
    end

    def edit
    end

    def create
      @allowance_entry = current_user.allowance_entries.build(allowance_entry_params)

      respond_to do |format|
        if @allowance_entry.save
          format.html { redirect_to [:admin, @allowance_entry], notice: 'Entry was successfully created.' }
          format.json { render :show, status: :created, location: @allowance_entry }
        else
          format.html { render :new }
          format.json { render json: @allowance_entry.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @allowance_entry.update(allowance_entry_params)
          format.html { redirect_to [:admin, @allowance_entry], notice: 'Entry was successfully updated.' }
          format.json { render :show, status: :ok, location: @allowance_entry }
        else
          format.html { render :edit }
          format.json { render json: @allowance_entry.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @allowance_entry.destroy
      respond_to do |format|
        format.html { redirect_to admin_allowance_entries_url, notice: 'Entry was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      def set_allowance_entry
        @allowance_entry = ::Allowance::Entry.find(params[:id])
      end

      def allowance_entry_params
        params.require(:allowance_entry).permit(:entry_date, :price, :payee, :category, :notes)
      end
  end
end
