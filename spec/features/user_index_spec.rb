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
  it 'displays the username of all other users' do
    visit users_path
    expect(page).to have_content 'List of Users'
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  it 'displays the profile picture for each user' do
    visit users_path

    expect(page).to have_css("img[src='#{@user.photo}']")
    expect(page).to have_css("img[src='#{@user2.photo}']")
  end

  it 'displays the number of posts each user has written' do
    visit users_path

    expect(page).to have_content("Number of Posts: #{@user.posts_counter}")
    expect(page).to have_content("Number of Posts: #{@user2.posts_counter}")
  end

  it 'redirects to a user\'s show page when clicking on the user' do
    visit users_path
    click_link @user2.name

    expect(page).to have_current_path(user_path(@user2))
  end
end
