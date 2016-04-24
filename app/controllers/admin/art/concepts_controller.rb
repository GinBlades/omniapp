module Admin
  class Art::ConceptsController < AdminController
    def create
    end

    private

      def concept_params
        params.require(:art_concept).permit(:art_subcategory_id, :art_mood_id, :art_genre_id, :name, :sources)
      end
  end
end
