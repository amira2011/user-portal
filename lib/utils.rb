require "faker"

class Utils
  def self.seed_data
    User.all.each do |user|
      20.times do
        lead = Lead.create!(
          user: Faker::Number.between(from: 1, to: 2),
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.email,
          phone: Faker::PhoneNumber.phone_number,
          address: Faker::Address.street_address,
          address2: Faker::Address.secondary_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          zip: Faker::Address.zip_code,
        )

        lead_detail = LeadDetail.create!(
          lead: lead,
          home_garage: Faker::Boolean.boolean,
          home_owner: Faker::Boolean.boolean,
          home_length: Faker::Number.between(from: 1000, to: 5000),
          interested_in_home_insurance: Faker::Boolean.boolean,
          interested_in_condo_insurance: Faker::Boolean.boolean,
          interested_in_life_insurance: Faker::Boolean.boolean,
          interested_in_renters_insurance: Faker::Boolean.boolean,
          interested_in_usage_based_policy: Faker::Boolean.boolean,
          currently_insured: Faker::Boolean.boolean,
          current_company: Faker::Company.name,
          current_customer: Faker::Number.between(from: 1, to: 10),
          continuous_coverage: Faker::Number.between(from: 1, to: 5),
          current_policy_expiration_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
          military_affiliation: Faker::Boolean.boolean,
        )
      end
    end
  end
end
