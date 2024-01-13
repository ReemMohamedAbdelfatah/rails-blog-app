class Like < ApplicationRecord # rubocop:disable Layout/EndOfLine
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :increment_post_likes_counter

  private

  def increment_post_likes_counter
    post.increment!(:likes_counter)
  end
end
