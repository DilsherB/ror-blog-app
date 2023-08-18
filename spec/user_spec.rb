require_relative './rails_helper'

RSpec.describe User, type: :model do
    #tests go here
    subject = User.new(name: "John", photo: "https://example.com", bio: "tttt", posts_counter:1)

    # before {subject.save}

  it "Check name to not be empty" do
    subject.name = nil
    expect(subject).to_not be_valid 
  end

  it "Check post counter is numeric" do
    subject.posts_counter = "a"
    expect(subject).to_not be_valid 
  end

  it "Check post counter is greater than 0" do
    subject.posts_counter = -1
    expect(subject).to_not be_valid 
  end

  it "must return recent posts as per given arguments" do
    user = User.create(name: "John", photo: "https://example.com", bio: "tttt", posts_counter:1)
    post1 = Post.create(author: user, title: "title1", text: "text1", comments_counter: 1, likes_counter: 1)
    post2 = Post.create(author: user, title: "title2", text: "text2", comments_counter: 1, likes_counter: 1)
    post3 = Post.create(author: user, title: "title3", text: "text3", comments_counter: 1, likes_counter: 1)
    expect(user.recent_posts(3)).to eq([post3, post2, post1])
    
  end
end
