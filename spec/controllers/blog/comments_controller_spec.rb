require 'rails_helper'

RSpec.describe Blog::CommentsController, type: :controller do
  describe 'Standard CRUD' do
    let(:instance_blog_comment) { assigns(:blog_comment) }
    let(:base_blog_comment) { create(:blog_comment) }
    let(:static_blog_comment) { create(:blog_comment, name: 'spec-blog_comment') }
    let(:valid_attributes) { attributes_for(:blog_comment, name: 'spec-blog_comment') }
    let(:invalid_attributes) { attributes_for(:blog_comment, name: nil) }
    describe 'GET #index' do
      it 'populates an array of all @blog_comments' do
        second_blog_comment = create :blog_comment
        get :index
        expect(assigns(:blog_comments)).to match_array([base_blog_comment, second_blog_comment])
      end
    end
    describe 'GET show' do
      it 'assigns the requested blog_comment as @blog_comment' do
        get :show, id: base_blog_comment
        expect(instance_blog_comment).to eq(base_blog_comment)
      end
    end
    describe 'GET new' do
      it 'assigns a new blog_comment as @blog_comment' do
        get :new
        expect(instance_blog_comment).to be_a_new(Blog::Comment)
      end
    end
    describe 'GET edit' do
      it 'assigns the requested blog_comment as @blog_comment' do
        get :edit, id: base_blog_comment
        expect(instance_blog_comment).to eq(base_blog_comment)
      end
    end
    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Blog::Comment' do
          expect do
            post :create, blog_comment: attributes_for(:blog_comment)
          end.to change(Blog::Comment, :count).by(1)
        end

        it 'assigns a newly created blog_comment as @blog_comment' do
          post :create, blog_comment: attributes_for(:blog_comment)
          expect(instance_blog_comment).to be_a(Blog::Comment)
          expect(instance_blog_comment).to be_persisted
        end

        it 'redirects to the created blog_comment' do
          post :create, blog_comment: attributes_for(:blog_comment)
          expect(response).to redirect_to(Blog::Comment.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved blog_comment as @blog_comment' do
          post :create, blog_comment: invalid_attributes
          expect(instance_blog_comment).to be_a_new(Blog::Comment)
        end

        it "re-renders the 'new' template" do
          post :create, blog_comment: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        it 'assigns the requested blog_comment as @blog_comment' do
          put :update, id: static_blog_comment, blog_comment: valid_attributes
          static_blog_comment.reload
          expect(instance_blog_comment).to eq(static_blog_comment)
        end

        it 'redirects to the blog_comment' do
          put :update, id: static_blog_comment, blog_comment: valid_attributes
          expect(response).to redirect_to(static_blog_comment)
        end
      end

      describe 'with invalid params' do
        it 'assigns the blog_comment as @blog_comment' do
          put :update, id: static_blog_comment, blog_comment: invalid_attributes
          expect(assigns(:blog_comment)).to eq(static_blog_comment)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_blog_comment, blog_comment: invalid_attributes
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested blog_comment' do
        new_blog_comment = create :blog_comment
        expect do
          delete :destroy, id: new_blog_comment
        end.to change(Blog::Comment, :count).by(-1)
      end

      it 'redirects to the blog_comment list' do
        delete :destroy, id: base_blog_comment
        expect(response).to redirect_to(blog_comments_url)
      end
    end
  end
end
