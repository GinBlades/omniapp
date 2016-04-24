module Admin
  class Art::ConceptsController < AdminController
    before_action :set_concept, only: [:show, :edit, :update, :destroy]
    def index
      @concepts = ::Art::Concept.all
    end

    def new
      @concept = ::Art::Concept.new
    end

    def show
    end

    def edit
    end

    def create
      @concept = ::Art::Concept.new(concept_params)
      if @concept.save
        redirect_to [:admin, @concept], notice: "You have created a new concept!"
      else
        render :new
      end
    end

    def update
      if @concept.update(concept_params)
        redirect_to [:admin, @concept], notice: "You have updated your concept!"
      else
        render :edit
      end
    end

    def destroy
      @concept.destroy
      redirect_to admin_art_concepts_path
    end

    private

      def set_concept
        @concept = ::Art::Concept.find(params[:id])
      end

      def concept_params
        params.require(:art_concept).permit(:art_subcategory_id, :art_mood_id, :art_genre_id, :name, :sources, :description)
      end
  end
end
