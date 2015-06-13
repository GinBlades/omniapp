module Points
  class OptionsController < ::AdminController
    before_action :set_goal
    before_action :set_points_option, only: [:edit, :update, :destroy]

    def new
      @points_option = @points_goal.options.build
    end

    def edit
    end

    def create
      @points_option = @points_goal.options.build(points_option_params)

      respond_to do |format|
        if @points_option.save
          format.html { redirect_to admin_points_goal_url(@points_goal), notice: 'Option was successfully created.' }
          format.json { render :show, status: :created, location: admin_points_goal_url(@points_goal) }
        else
          format.html { render :new }
          format.json { render json: @points_option.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @points_option.update(points_option_params)
          format.html { redirect_to admin_points_goal_url(@points_goal), notice: 'Option was successfully updated.' }
          format.json { render :show, status: :ok, location: admin_points_goal_url(@points_goal) }
        else
          format.html { render :edit }
          format.json { render json: @points_option.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @points_option.destroy
      respond_to do |format|
        format.html { redirect_to admin_points_goal_url(@points_goal), notice: 'Option was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

      def set_points_goal
        @points_goal = Goal.find(params[:goal_id])
      end

      def set_points_option
        @points_option = Option.find(params[:id])
      end

      def points_option_params
        params.require(:points_option).permit(:description, :points)
      end
  end
end
