require "rails_helper"

RSpec.describe Notes::CategoriesController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_notes_category) { assigns(:notes_category) }
    let(:base_notes_category) { create(:notes_category) }
    let(:static_notes_category) { create(:notes_category, name: "spec-notes_category") }
    let(:valid_attributes) { attributes_for(:notes_category, name: "spec-notes_category") }
    let(:invalid_attributes) { attributes_for(:notes_category, name: nil) }
    describe "GET #index" do
      it "populates an array of all @notes_categories" do
        second_notes_category = create :notes_category
        get :index
        expect(assigns(:notes_categories)).to match_array([base_notes_category, second_notes_category])
      end
    end
    describe "GET show" do
      it "assigns the requested notes_category as @notes_category" do
        get :show, id: base_notes_category
        expect(instance_notes_category).to eq(base_notes_category)
      end
    end
    describe "GET new" do
      it "assigns a new notes_category as @notes_category" do
        get :new
        expect(instance_notes_category).to be_a_new(Notes::Category)
      end
    end
    describe "GET edit" do
      it "assigns the requested notes_category as @notes_category" do
        get :edit, id: base_notes_category
        expect(instance_notes_category).to eq(base_notes_category)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Notes::Category" do
          expect do
            post :create, notes_category: attributes_for(:notes_category)
          end.to change(Notes::Category, :count).by(1)
        end

        it "assigns a newly created notes_category as @notes_category" do
          post :create, notes_category: attributes_for(:notes_category)
          expect(instance_notes_category).to be_a(Notes::Category)
          expect(instance_notes_category).to be_persisted
        end

        it "redirects to the created notes_category" do
          post :create, notes_category: attributes_for(:notes_category)
          expect(response).to redirect_to(Notes::Category.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved notes_category as @notes_category" do
          post :create, notes_category: invalid_attributes
          expect(instance_notes_category).to be_a_new(Notes::Category)
        end

        it "re-renders the 'new' template" do
          post :create, notes_category: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested notes_category as @notes_category" do
          put :update, id: static_notes_category, notes_category: valid_attributes
          static_notes_category.reload
          expect(instance_notes_category).to eq(static_notes_category)
        end

        it "redirects to the notes_category" do
          put :update, id: static_notes_category, notes_category: valid_attributes
          expect(response).to redirect_to(static_notes_category)
        end
      end

      describe "with invalid params" do
        it "assigns the notes_category as @notes_category" do
          put :update, id: static_notes_category, notes_category: invalid_attributes
          expect(assigns(:notes_category)).to eq(static_notes_category)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_notes_category, notes_category: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested notes_category" do
        new_notes_category = create :notes_category
        expect do
          delete :destroy, id: new_notes_category
        end.to change(Notes::Category, :count).by(-1)
      end

      it "redirects to the notes_category list" do
        delete :destroy, id: base_notes_category
        expect(response).to redirect_to(notes_categories_url)
      end
    end
  end
end
