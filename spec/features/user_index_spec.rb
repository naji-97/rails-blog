require 'rails_helper'
RSpec.describe 'User Index Page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Example User', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                           bio: 'I am a user')
    @user2 = User.create!(name: 'Example User2', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                          bio: 'I am a user')
    @user3 = User.create!(name: 'Example User3', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                          bio: 'I am a user')
    @user4 = User.create!(name: 'Example User4', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                          bio: 'I am a user')
  end

end