# RSpec feature test
require "rails_helper"

RSpec.describe "Leads Index", type: :feature do
  let(:user) { create(:user) }
  let!(:lead) { create(:lead, user: user, first_name: "John", last_name: "Doe") }

  before do
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Login"
    visit leads_path
  end

  it "shows the lead for the logged in user" do
    expect(page).to have_content("John Doe")
  end
end
