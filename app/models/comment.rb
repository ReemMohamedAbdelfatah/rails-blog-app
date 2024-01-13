class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  attribute :text, :text

  after_save :increment_post_comments_counter

  private

  def increment_post_comments_counter
    post.increment!(:comments_counter)
  end
end
