module Admin
  class Art::ConceptsController < AdminController
    before_action :set_concept, except: [:index, :new, :create]
    def index
      @concepts = ::Art::Concept.includes(:art_mood, :art_genre, art_subcategory: :art_category)
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

    def add_detail
      @concept.art_details << ::Art::Detail.find(params[:detail])
      redirect_to [:admin, @concept]
    end

    def remove_detail
      @concept.art_details.delete(::Art::Detail.find(params[:detail]))
      redirect_to [:admin, @concept]
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
