require "rails_helper"

RSpec.describe Dictionary::LanguagesController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_dictionary_language) { assigns(:dictionary_language) }
    let(:base_dictionary_language) { create(:dictionary_language) }
    let(:static_dictionary_language) { create(:dictionary_language, name: "spec-dictionary_language") }
    let(:valid_attributes) { attributes_for(:dictionary_language, name: "spec-dictionary_language") }
    let(:invalid_attributes) { attributes_for(:dictionary_language, name: nil) }
    describe "GET #index" do
      it "populates an array of all @dictionary_languages" do
        second_dictionary_language = create :dictionary_language
        get :index
        expect(assigns(:dictionary_languages)).to match_array([base_dictionary_language, second_dictionary_language])
      end
    end
    describe "GET show" do
      it "assigns the requested dictionary_language as @dictionary_language" do
        get :show, id: base_dictionary_language
        expect(instance_dictionary_language).to eq(base_dictionary_language)
      end
    end
    describe "GET new" do
      it "assigns a new dictionary_language as @dictionary_language" do
        get :new
        expect(instance_dictionary_language).to be_a_new(Dictionary::Language)
      end
    end
    describe "GET edit" do
      it "assigns the requested dictionary_language as @dictionary_language" do
        get :edit, id: base_dictionary_language
        expect(instance_dictionary_language).to eq(base_dictionary_language)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Dictionary::Language" do
          expect do
            post :create, dictionary_language: attributes_for(:dictionary_language)
          end.to change(Dictionary::Language, :count).by(1)
        end

        it "assigns a newly created dictionary_language as @dictionary_language" do
          post :create, dictionary_language: attributes_for(:dictionary_language)
          expect(instance_dictionary_language).to be_a(Dictionary::Language)
          expect(instance_dictionary_language).to be_persisted
        end

        it "redirects to the created dictionary_language" do
          post :create, dictionary_language: attributes_for(:dictionary_language)
          expect(response).to redirect_to(Dictionary::Language.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved dictionary_language as @dictionary_language" do
          post :create, dictionary_language: invalid_attributes
          expect(instance_dictionary_language).to be_a_new(Dictionary::Language)
        end

        it "re-renders the 'new' template" do
          post :create, dictionary_language: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested dictionary_language as @dictionary_language" do
          put :update, id: static_dictionary_language, dictionary_language: valid_attributes
          static_dictionary_language.reload
          expect(instance_dictionary_language).to eq(static_dictionary_language)
        end

        it "redirects to the dictionary_language" do
          put :update, id: static_dictionary_language, dictionary_language: valid_attributes
          expect(response).to redirect_to(static_dictionary_language)
        end
      end

      describe "with invalid params" do
        it "assigns the dictionary_language as @dictionary_language" do
          put :update, id: static_dictionary_language, dictionary_language: invalid_attributes
          expect(assigns(:dictionary_language)).to eq(static_dictionary_language)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_dictionary_language, dictionary_language: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested dictionary_language" do
        new_dictionary_language = create :dictionary_language
        expect do
          delete :destroy, id: new_dictionary_language
        end.to change(Dictionary::Language, :count).by(-1)
      end

      it "redirects to the dictionary_language list" do
        delete :destroy, id: base_dictionary_language
        expect(response).to redirect_to(dictionary_languages_url)
      end
    end
  end
end
