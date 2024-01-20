class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'userid_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'postid_id'

  after_save :increment_post_likes_counter

  private

  def increment_post_likes_counter
    post.increment!(:likes_counter)
  end
end
