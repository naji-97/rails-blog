require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET /users/:user_id/posts' do
    let(:user) { User.create(name: 'Test User') }
    let!(:post1) { Post.create(author: user, title: 'Post 1', text: 'Text 1') }
    let!(:post2) { Post.create(author: user, title: 'Post 2', text: 'Text 2') }

    it 'returns a success response' do
      get user_posts_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(user)
      expect(response.body).to include("List of Posts for #{user.name}")
      expect(response.body).to include(post1.title)
      expect(response.body).to include(post2.title)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    let(:user) { User.create(name: 'Test User') }
    let(:post) { Post.create(author: user, title: 'Post', text: 'Text') }
    let!(:comment1) { Comment.create(post:, author: user, text: 'Comment 1') }
    let!(:comment2) { Comment.create(post:, author: user, text: 'Comment 2') }

    it 'returns a success response' do
      get user_post_path(user, post)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_post_path(user, post)
      expect(response.body).to include(post.title)
      expect(response.body).to include(post.text)
      expect(response.body).to include(comment1.text)
      expect(response.body).to include(comment2.text)
    end
  end
end
