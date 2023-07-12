class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  private

  def update_post_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_comment(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  after_create :save
  after_save :update_post_counter

  after_destroy :update_post_counter
end
