require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  subject { @user = User.create(name: 'Rose', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Doctor', posts_counter: 1) }

  before { subject.save }
  describe 'GET #index' do
    before(:example) { get users_path }

    it 'returns http success status' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include(@user.name)
    end
  end

  describe 'GET #show' do
    before(:example) { get user_path(id: @user.id) }

    it 'returns http success status' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include(@user.name)
    end
  end
end
