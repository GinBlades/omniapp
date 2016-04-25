class Admin::Art::DetailsController < ApplicationController
  def index
    @details = ::Art::Detail.order(:name)
    concepts = ::Art::Concept.all.map { |c| [c.name, ["concept", c.id].join("-")] }
    subcategories = ::Art::Subcategory.all.map { |s| [s.name, ["subcategory", s.id].join("-")] }
    @groups = [["Concepts", concepts], ["Subcategories", subcategories]]
    @selected = params[:selected]
  end

  def create
  end

  def add_to
    resource = parse_resource_params(params[:resource])
    details = ::Art::Detail.where(id: params[:details].map(&:to_i))
    details.each do |detail|
      next if resource.art_details.include?(detail)
      resource.art_details << detail
    end
    redirect_to [:admin, resource]
  end

  private

    def parse_resource_params(param)
      pieces = param.split("-")
      if pieces[0] == "concept"
        ::Art::Concept.find(pieces[1].to_i)
      else
        ::Art::Subcategory.find(pieces[1].to_i)
      end
    end
end
