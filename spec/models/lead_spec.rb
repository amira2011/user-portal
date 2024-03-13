require "rails_helper"

RSpec.describe Lead, type: :model do
  it "is valid with valid attributes" do
    lead = create(:lead)
    expect(lead).to be_valid
  end
end
# bundle exec rspec spec/models/lead_spec.rb
