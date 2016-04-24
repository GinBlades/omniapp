module Admin
  class Art::DashboardController < AdminController
    def index
      @random_concept = ::Art::Concept.new(art_subcategory: ::Art::Subcategory.random,
                                           art_mood: ::Art::Mood.random,
                                           art_genre: ::Art::Genre.random)
    end
    
    def new_grouping
      build_new(params)
      redirect_to admin_art_path
    end

    private

      def build_new(params)
        valid_params = filter_grouping(params)
        valid_params.each { |k, v| new_from(k, v, valid_params) }
      end

      def model_names
        %w(category subcategory detail mood genre)
      end

      def filter_grouping(params)
        params.select { |k, v| model_names.include?(k) }
          .reject { |k, v| v.blank? }
      end

      def new_from(model_name, value, valid_params)
        association_needed = %w(subcategory)
        if association_needed.include?(model_name)
          make_with_association(model_name, value, valid_params)
        else 
          model = "Art::#{model_name.camelcase(:upper)}".constantize
          model.find_or_create_by(name: value)
        end
      end

      def make_with_association(model_name, value, valid_params)
        if model_name == "subcategory"
          make_subcategory(model_name, value, valid_params)
        end
      end

      def make_subcategory(model_name, value, valid_params)
        cat = ::Art::Category.where("name ILIKE ? ", valid_params['category']).first
        return unless cat
        ::Art::Subcategory.find_or_create_by(art_category: cat, name: value)
      end
  end
end
