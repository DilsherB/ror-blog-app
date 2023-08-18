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

end
