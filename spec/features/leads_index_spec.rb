# RSpec feature test
require "rails_helper"

RSpec.describe "Leads Index", type: :feature do
  let(:user) { create(:user) } # Assuming you have a properly set up user factory.
  let!(:lead) { create(:lead, user: user, first_name: "John", last_name: "Doe") }

  before do
    # Log in as user
    visit login_path # Uses named route :login
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"
    visit leads_path
  end

  it "shows the lead for the logged in user" do
    expect(page).to have_content("John Doe")
  end
end
