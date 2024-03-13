require "rails_helper"

RSpec.describe "User Login", type: :feature do
  let!(:user) { FactoryBot.create(:user, email: "john.doe@example.com", password: "123456", password_confirmation: "123456") }

  scenario "user logs in successfully with valid credentials" do
    FactoryBot.create(:lead, user: user, first_name: "John", last_name: "Doe")

    visit login_path

    fill_in "email", with: "john.doe@example.com"
    fill_in "password", with: "123456"

    click_button "Login"

    expect(page).to have_content("john.doe@example.com")
  end
end
