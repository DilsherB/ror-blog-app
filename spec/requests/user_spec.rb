require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) do
    User.create(name: 'Anything',
                photo: 'http://licalhost:3000/anything.jpg',
                bio: 'Anything test',
                posts_counter: 0)
  end

  describe 'index page' do
    it 'renders the users\' index page' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'render user template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'shows the data of index page' do
      get users_path
      expect(response.body).to include('All users')
    end
  end
  describe 'show page' do
    it 'renders specific users\'s detail page successfully' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders specific users\'s template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end

    it 'shows the data of show page' do
      get "/users/#{user.id}"
      expect(response.body).to include('Detail of')
    end
  end
end
