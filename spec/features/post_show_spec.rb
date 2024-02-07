require 'rails_helper'

RSpec.describe 'Post Index View Page', type: :feature do
  let!(:user1) do
    User.create(
      name: 'Test User 1',
      photo: 'https://images.example.com/i/086/5621234.jpg',
      bio: 'Test Bio 1',
      posts_counter: 1
    )
  end

  let!(:post1) do
    Post.create(author: user1, title: 'Post 1', text: 'Post 1 content', comments_counter: 1, likes_counter: 0)
  end

  let!(:comment1) do
    Comment.create(post: post1, user: user1, text: 'Nice comment 1!')
  end

  let!(:comment2) do
    Comment.create(post: post1, user: user1, text: 'Nice comment 2!')
  end

  let!(:comment3) do
    Comment.create(post: post1, user: user1, text: 'Nice comment 3!')
  end

  let!(:comment4) do
    Comment.create(post: post1, user: user1, text: 'Nice comment 4!')
  end

  let!(:comment5) do
    Comment.create(post: post1, user: user1, text: 'Nice comment 5!')
  end


end
