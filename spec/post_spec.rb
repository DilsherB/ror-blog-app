require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'John', photo: 'https://example.com', bio: 'tttt', posts_counter: 1)
  post1 = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

  it "Check title is not null" do
    post1.title = nil
    expect(post1).to_not be_valid
  end

  it "Check title is not greater than 250 characters" do
    post1.title = "a" * 251
    expect(post1).to_not be_valid
  end

  it "Check comments counter is numeric" do
    post1.comments_counter = "a"
    expect(post1).to_not be_valid
  end

  it "Check comments counter is greater than 0" do
    post1.comments_counter = -1
    expect(post1).to_not be_valid
  end

  it "Check likes counter is numeric" do
    post1.likes_counter = "a"
    expect(post1).to_not be_valid
  end

  it "Check likes counter is greater than 0" do
    post1.likes_counter = -1
    expect(post1).to_not be_valid
  end
end