require 'rails_helper'

RSpec.describe Health::RatingsController, :type => :controller do

  
  describe "Standard CRUD" do
    let(:instance_health_rating) { assigns(:health_rating) }
    let(:base_health_rating) { create(:health_rating) }
    let(:static_health_rating) { create(:health_rating, name: 'spec-health_rating') }
    let(:valid_attributes) { attributes_for(:health_rating, name: 'spec-health_rating') }
    let(:invalid_attributes) { attributes_for(:health_rating, name: nil) }
    describe "GET #index" do
      it "populates an array of all @health_ratings" do
        second_health_rating = create :health_rating
        get :index
        expect(assigns(:health_ratings)).to match_array([base_health_rating, second_health_rating])
      end
    end
    describe "GET show" do
      it "assigns the requested health_rating as @health_rating" do
        get :show, id: base_health_rating
        expect(instance_health_rating).to eq(base_health_rating)
      end
    end
    describe "GET new" do
      it "assigns a new health_rating as @health_rating" do
        get :new
        expect(instance_health_rating).to be_a_new(Health::Rating)
      end
    end
    describe "GET edit" do
      it "assigns the requested health_rating as @health_rating" do
        get :edit, id: base_health_rating
        expect(instance_health_rating).to eq(base_health_rating)
      end
    end
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Health::Rating" do
          expect {
            post :create, health_rating: attributes_for(:health_rating)
          }.to change(Health::Rating, :count).by(1)
        end

        it "assigns a newly created health_rating as @health_rating" do
          post :create, health_rating: attributes_for(:health_rating)
          expect(instance_health_rating).to be_a(Health::Rating)
          expect(instance_health_rating).to be_persisted
        end

        it "redirects to the created health_rating" do
          post :create, health_rating: attributes_for(:health_rating)
          expect(response).to redirect_to(Health::Rating.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved health_rating as @health_rating" do
          post :create, health_rating: invalid_attributes
          expect(instance_health_rating).to be_a_new(Health::Rating)
        end

        it "re-renders the 'new' template" do
          post :create, health_rating: invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested health_rating as @health_rating" do
          put :update, id: static_health_rating, health_rating: valid_attributes
          static_health_rating.reload
          expect(instance_health_rating).to eq(static_health_rating)
        end

        it "redirects to the health_rating" do
          put :update, id: static_health_rating, health_rating: valid_attributes
          expect(response).to redirect_to(static_health_rating)
        end
      end

      describe "with invalid params" do
        it "assigns the health_rating as @health_rating" do
          put :update, id: static_health_rating, health_rating: invalid_attributes
          expect(assigns(:health_rating)).to eq(static_health_rating)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_health_rating, health_rating: invalid_attributes
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested health_rating" do
        new_health_rating = create :health_rating
        expect {
          delete :destroy, id: new_health_rating
        }.to change(Health::Rating, :count).by(-1)
      end

      it "redirects to the health_rating list" do
        delete :destroy, id: base_health_rating
        expect(response).to redirect_to(health_ratings_url)
      end
    end

  end
end
