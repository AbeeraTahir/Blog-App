require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Api::V1::PostsController', type: :request do
  path '/api/v1/users/{user_id}/posts' do
    get 'Returns a list of posts for the given user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :integer, description: 'ID of the user to fetch posts for'

      response '200', 'posts found' do
        let(:user) { create(:user) }
        let(:user_id) { user.id }
        let!(:posts) { create_list(:post, 5, author: user) }
        run_test!
      end
    end
  end
end