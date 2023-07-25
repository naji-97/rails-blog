require 'rails_helper'
RSpec.describe 'PostIndex', type: :feature do
  describe 'post index test' do
    before(:each) do
      @user = User.create!(name: 'User', photo: 'https://unsplash.com/photos/WNoLnJo7tS8', posts_counter: 3,
                           bio: 'I am a user')
      visit root_path
      @post = Post.create!(title: 'Post', text: 'This is a post', comments_counter: 3,
                           likes_counter: 3, author_id: @user.id)
      @post2 = Post.create!(title: 'Post2', text: 'This is a post2', comments_counter: 3,
                            likes_counter: 3, author_id: @user.id)
      @comment1 = Comment.create!(text: 'This is a comment', author_id: @user.id, post_id: @post.id)
      @comment2 = Comment.create!(text: 'This is a comment2', author_id: @user.id, post_id: @post.id)
      visit user_posts_path(@user)
    end
    it 'displays the user name' do
      expect(page).to have_content(@user.name)
    end
    it 'dispalys user image' do
      visit users_path
      expect(page).to have_css("img[src='https://unsplash.com/photos/WNoLnJo7tS8']")
    end
    it 'displays the user posts counter' do
      expect(page).to have_content(@user.posts_counter)
    end
    it 'displays the post recent comments' do
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
    end
    it 'displays the post title' do
      expect(page).to have_content(@post.title)
    end
    it 'displays the post comments counter' do
      expect(page).to have_content(@post.comments_counter)
    end
    it 'displays the post comments' do
      expect(page).to have_content(@post.comments_counter)
    end
    it 'displays the post likes counter' do
      expect(page).to have_content(@post.likes_counter)
    end
    it 'displays the post author name' do
      expect(page).to have_content(@post.author.name)
    end
    it 'show post body' do
      expect(page).to have_content(@post.text)
    end
    it 'redirects to posts show page' do
      click_link @post2.title
      expect(page).to have_current_path user_post_path(@user, @post2)
    end
  end
end
