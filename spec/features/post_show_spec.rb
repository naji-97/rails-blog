require 'rails_helper'
RSpec.describe 'PostShow', type: :feature do
  describe 'post show test' do
    before(:each) do
      @user = User.create!(name: 'Example User', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                           bio: 'I am a user')
      @user2 = User.create!(name: 'Example User2', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
      @user3 = User.create!(name: 'Example User3', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
      @user4 = User.create!(name: 'Example User4', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
      @post = Post.create!(title: 'This is my first post', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 3, author_id: @user.id)
      @post2 = Post.create!(title: 'This is my second post', text: 'This is my second post', comments_counter: 0,
                            likes_counter: 3, author_id: @user.id)
      @post3 = Post.create!(title: 'This is my third post', text: 'This is my third post', comments_counter: 0,
                            likes_counter: 3, author_id: @user.id)
      @post4 = Post.create!(title: 'This is my fourth post', text: 'This is my fourth post', comments_counter: 0,
                            likes_counter: 3, author_id: @user.id)
      @post5 = Post.create!(title: 'This is my fifth post', text: 'This is my fifth post', comments_counter: 0,
                            likes_counter: 3, author_id: @user.id)
      @comment1 = Comment.create!(text: 'This is my first comment', author_id: @user2.id, post_id: @post.id)
      @comment2 = Comment.create!(text: 'This is my second comment', author_id: @user3.id, post_id: @post.id)
      @comment3 = Comment.create!(text: 'This is my third comment', author_id: @user4.id, post_id: @post.id)
      @comment4 = Comment.create!(text: 'This is my fourth comment', author_id: @user.id, post_id: @post.id)
      visit user_post_path(@user, @post)
    end
    it 'displays the post text' do
      expect(page).to have_content(@post.text)
    end
    it 'display the comment counter' do
      expect(page).to have_content('Comments: 4')
    end
    it 'displays the user name of commentor' do
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
      expect(page).to have_content(@user4.name)
    end
    it 'displays the post comments' do
      expect(page).to have_content(@comment3.text)
      expect(page).to have_content(@comment4.text)
      expect(page).to have_content(@comment2.text)
      expect(page).to have_content(@comment1.text)
    end
    it 'displays the post likes counter' do
      expect(page).to have_content(@post.likes_counter)
    end
    it 'displays the post author name' do
      expect(page).to have_content(@post.author.name)
    end
    it 'displays the post title' do
      expect(page).to have_content(@post.title)
    end
  end
end
