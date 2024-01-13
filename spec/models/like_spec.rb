require 'rails_helper'
RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Reem Muhammed') }
  let(:post) { Post.create(author: user, title: 'My Post', text: 'This is my post content.') }

  it 'increments the likes_counter of the associated post after saving a like' do
    like = Like.create(user:, post:)
    original_likes_counter = post.likes_counter
    like.save
    post.reload
    expect(post.likes_counter).to eq(original_likes_counter + 1)
  end

  it 'is valid with valid attributes' do
    user = User.create(name: 'Reem Muhammed')
    post = Post.create(author: user, title: 'My Post', text: 'This is my post content.')
    like = Like.new(user:, post:)
    expect(like).to be_valid
  end
end
