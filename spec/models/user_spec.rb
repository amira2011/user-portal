require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = create(:user)
    puts "User email: #{user.email}"
    expect(user).to be_valid
  end
end
# bundle exec rspec spec/models/user_spec.rb
