require 'rails_helper'
RSpec.describe 'User Index Page', type: :feature do
  let!(:user1) { User.create(name: 'User 1') }
  let!(:user2) { User.create(name: 'User 2') }

  it 'displays the username of all other users' do
    visit users_path

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  it 'displays the profile picture for each user' do
    visit users_path

    expect(page).to have_css("img[src='#{user1.photo}']")
    expect(page).to have_css("img[src='#{user2.photo}']")
  end

  it 'displays the number of posts each user has written' do
    visit users_path

    expect(page).to have_content("Number of Posts: #{user1.posts_counter}")
    expect(page).to have_content("Number of Posts: #{user2.posts_counter}")
  end

  it 'redirects to a user\'s show page when clicking on the user' do
    visit users_path
    click_link user1.name

    expect(page).to have_current_path(user_path(user1))
  end
end
