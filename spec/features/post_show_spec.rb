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

  
end
