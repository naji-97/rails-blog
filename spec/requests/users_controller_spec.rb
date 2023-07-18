require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET /users' do
    let!(:user1) { User.create(name: 'User 1') }
    let!(:user2) { User.create(name: 'User 2') }

    it 'returns a success response' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include(user1.name)
      expect(response.body).to include(user2.name)
    end
  end

  describe 'GET /users/:id' do
    let(:user) { User.create(name: 'Test User') }

    it 'returns a success response' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_path(user)
      expect(response.body).to include(user.name)
    end
  end
end
