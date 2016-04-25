class Admin::Art::SubcategoriesController < ApplicationController
  def show
    @subcategory = ::Art::Subcategory.find(params[:id])
  end
end
