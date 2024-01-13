class Post < ApplicationRecord # rubocop:disable Layout/EndOfLine
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :postid
  has_many :likes, foreign_key: :postid

  attribute :title, :text
  attribute :text, :text
  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  after_save :increment_author_posts_counter

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  def increment_author_posts_counter
    puts 'Callback invoked!'
    author.increment!(:posts_counter)
  end
end
