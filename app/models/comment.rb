class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  validates :text, presence: true

  after_save :update_comments_counter
  after_destroy :decrement_comments

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def decrement_comments
    post.decrement!(:comments_counter)
  end
end
