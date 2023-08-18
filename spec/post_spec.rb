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

  it "must return recent comments as per given arguments" do
    user = User.create(name: "John", photo: "https://example.com", bio: "tttt", posts_counter:1)
    post1 = Post.create(author: user, title: "title1", text: "text1", comments_counter: 1, likes_counter: 1)
    comment1 = Comment.create(post: post1, author: user, text: "comment1")
    comment2 = Comment.create(post: post1, author: user, text: "comment2")
    comment3 = Comment.create(post: post1, author: user, text: "comment3")
    expect(post1.recent_comment(3)).to eq([comment3, comment2, comment1])
  end

  it "must update post counter by 1 on every new post" do
    user = User.create(name: "John", photo: "https://example.com", bio: "tttt")
    post1 = Post.create(author: user, title: "title1", text: "text1", comments_counter: 1, likes_counter: 1)
    expect(user.posts_counter).to eq(1)
    post2 = Post.create(author: user, title: "title1", text: "text1", comments_counter: 1, likes_counter: 1)
    expect(user.posts_counter).to eq(2)
  end
end