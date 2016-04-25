class Admin::Art::RevisionsController < ApplicationController
  before_action :set_concept
  before_action :set_revision, only: [:edit, :update, :destroy]

  def new
    @revision = @concept.art_revisions.build
  end

  def edit
  end

  def create
    @revision = @concept.art_revisions.build(art_revision_params)
    if @revision.save
      redirect_to [:admin, @concept], notice: "Revision added."
    else
      render :new
    end
  end

  def update
    if @revision.update(art_revision_params)
      redirect_to [:admin, @concept], notice: "Revision updated."
    else
      render :new
    end
  end

  def destroy
    @revision.destroy
    redirect_to [:admin, @concept], notice: "Revision deleted."
  end

  private

    def set_concept
      @concept = ::Art::Concept.find(params[:concept_id])
    end

    def set_revision
      @revision = ::Art::Revision.find(params[:id])
    end

    def art_revision_params
      params.require(:art_revision).permit(:version, :image, :notes)
    end
end
