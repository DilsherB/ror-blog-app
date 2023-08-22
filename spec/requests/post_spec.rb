require 'rails_helper'

RSpec.describe 'posts', type: :request do
  user = User.create(name: 'Anything', photo: 'http://licalhost:3000/anything.jpg', bio: 'Anything test', posts_counter: 0)
  post = Post.create(author: user, title: 'post', text: 'This is my post', comments_counter: 0, likes_counter: 0)

  describe 'main post\'s page' do
    it 'renders the main page successfully' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
    end

    it 'renders index template of post' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end

    it 'show the post\'s index page data' do
      get "/users/#{user.id}/posts"
      expect(response.body).to include('Posts by user')
    end
  end

  describe 'show page of posts' do
    it 'renders a specific post\'s page successfully' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(:success)
    end

    it 'render show template of post' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end

    it 'shows the post\'s show page data' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Specific post')
    end
  end
end