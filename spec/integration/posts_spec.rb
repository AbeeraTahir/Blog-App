require 'rails_helper'

RSpec.describe 'Post testing', type: :feature do
  describe 'index page' do
    before(:example) do 
      @user = User.create(name: 'Abeera', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer', posts_counter: 1)
      @post = Post.create(title: 'AI', text: 'Great post', comments_counter: 2, likes_counter: 1, author: @user)
      @first_comment = Comment.create(text: 'First comment', author: @user, post: @post)
      @second_comment = Comment.create(text: 'Second comment', author: @user, post: @post)
      Like.create(author: @user, post: @post)
      visit user_posts_path(user_id: @user.id)
    end

  end

  describe 'show page' do
    before(:example) do 
      @user1 = User.create(name: 'Abeera', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer', posts_counter: 1)
      @user2 = User.create(name: 'Zia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Engineer', posts_counter: 1)
      @post = Post.create(title: 'AI', text: 'Great post', comments_counter: 2, likes_counter: 1, author: @user1)
      @first_comment = Comment.create(text: 'First comment', author: @user1, post: @post)
      @second_comment = Comment.create(text: 'Second comment', author: @user2, post: @post)
      Like.create(author: @user1, post: @post)
      visit user_post_path(user_id: @user1.id, id: @post.id)
    end

  end
end