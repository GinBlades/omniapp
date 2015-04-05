require 'rails_helper'

RSpec.describe Blog::PostsController, type: :controller do

  
  describe 'Standard CRUD' do
    let(:instance_blog_post) { assigns(:blog_post) }
    let(:base_blog_post) { create(:blog_post) }
    let(:static_blog_post) { create(:blog_post, name: 'spec-blog_post') }
    let(:valid_attributes) { attributes_for(:blog_post, name: 'spec-blog_post') }
    let(:invalid_attributes) { attributes_for(:blog_post, name: nil) }
    describe 'GET #index' do
      it 'populates an array of all @blog_posts' do
        second_blog_post = create :blog_post
        get :index
        expect(assigns(:blog_posts)).to match_array([base_blog_post, second_blog_post])
      end
    end
    describe 'GET show' do
      it 'assigns the requested blog_post as @blog_post' do
        get :show, id: base_blog_post
        expect(instance_blog_post).to eq(base_blog_post)
      end
    end
    describe 'GET new' do
      it 'assigns a new blog_post as @blog_post' do
        get :new
        expect(instance_blog_post).to be_a_new(Blog::Post)
      end
    end
    describe 'GET edit' do
      it 'assigns the requested blog_post as @blog_post' do
        get :edit, id: base_blog_post
        expect(instance_blog_post).to eq(base_blog_post)
      end
    end
    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Blog::Post' do
          expect {
            post :create, blog_post: attributes_for(:blog_post)
          }.to change(Blog::Post, :count).by(1)
        end

        it 'assigns a newly created blog_post as @blog_post' do
          post :create, blog_post: attributes_for(:blog_post)
          expect(instance_blog_post).to be_a(Blog::Post)
          expect(instance_blog_post).to be_persisted
        end

        it 'redirects to the created blog_post' do
          post :create, blog_post: attributes_for(:blog_post)
          expect(response).to redirect_to(Blog::Post.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved blog_post as @blog_post' do
          post :create, blog_post: invalid_attributes
          expect(instance_blog_post).to be_a_new(Blog::Post)
        end

        it "re-renders the 'new' template" do
          post :create, blog_post: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        it 'assigns the requested blog_post as @blog_post' do
          put :update, id: static_blog_post, blog_post: valid_attributes
          static_blog_post.reload
          expect(instance_blog_post).to eq(static_blog_post)
        end

        it 'redirects to the blog_post' do
          put :update, id: static_blog_post, blog_post: valid_attributes
          expect(response).to redirect_to(static_blog_post)
        end
      end

      describe 'with invalid params' do
        it 'assigns the blog_post as @blog_post' do
          put :update, id: static_blog_post, blog_post: invalid_attributes
          expect(assigns(:blog_post)).to eq(static_blog_post)
        end

        it "re-renders the 'edit' template" do
          put :update, id: static_blog_post, blog_post: invalid_attributes
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested blog_post' do
        new_blog_post = create :blog_post
        expect {
          delete :destroy, id: new_blog_post
        }.to change(Blog::Post, :count).by(-1)
      end

      it 'redirects to the blog_post list' do
        delete :destroy, id: base_blog_post
        expect(response).to redirect_to(blog_posts_url)
      end
    end

  end
end
