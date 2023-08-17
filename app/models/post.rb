class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_create :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter, 1)
  end

  def recent_comment(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
