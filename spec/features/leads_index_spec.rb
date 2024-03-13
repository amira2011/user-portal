# RSpec feature test
require "rails_helper"

RSpec.describe "Leads Index", type: :feature do
  let(:user) { create(:user) }
  let!(:lead) { create(:lead, user: user, first_name: "John", last_name: "Doe") }

  before do
    visit login_path
    puts "User email: #{user.email}"
    puts "User password: #{user.password}"
    fill_in "email", with: user.email
    fill_in "password", with: "123456"
    click_button "Login"
    visit leads_path
  end

  it "shows the lead for the logged in user" do
    expect(page).to have_content("john.doe@example.com")
    expect(page).to have_content("97404")
  end
end

# bundle exec rspec spec/features/leads_index_spec.rb
