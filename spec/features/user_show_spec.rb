require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
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

  it 'displays the user\'s profile picture' do
    visit user_path(@user)

    expect(page).to have_css("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'displays the user\'s username' do
    visit user_path(@user)

    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts the user has written' do
    visit user_path(@user)

    expect(page).to have_content("Number of Posts: #{@user.posts_counter}")
  end

  it 'displays the user\'s bio' do
    visit user_path(@user)

    expect(page).to have_content(@user.bio)
  end


  it 'redirects to a user\'s post index page when clicking "See All Posts"' do
    visit user_path(@user)
    click_link 'See All Posts'

    expect(page).to have_current_path(user_posts_path(@user))
  end
end
