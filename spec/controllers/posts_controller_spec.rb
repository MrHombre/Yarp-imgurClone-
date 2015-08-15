require 'rails_helper'

describe PostsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      before(:each) do
        user = FactoryGirl.create :user
        sign_in user
      end

      it 'creates a post' do
        post :create, post: attributes_for(:post)
        expect(Post.count).to eq(1)
      end

      it 'redirects to the "root" action for the new post' do
        post :create, post: attributes_for(:post)
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      before(:each) do
        user = FactoryGirl.create :user
        sign_in user
      end

      it 'does not create a post' do
        post :create, post: attributes_for(:post, title: nil)
        expect(Post.count).to eq(0)
      end

      it 're-render the new view' do
        post :create, post: attributes_for(:post, title: nil)
        expect(response).to render_template :new
      end
    end
  end
end
