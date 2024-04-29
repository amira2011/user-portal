# lib/tasks/populate_database.rake

namespace :db do
  desc "Populate users, leads, and lead details"
  task populate_data: :environment do
    # Populate Users
    5.times do
      user = User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "12345",
        password_confirmation: "12345",
      )

      # Populate Leads and Lead Details for each User
      20.times do
        lead = Lead.create!(
          user: user,
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

        LeadDetail.create!(
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

        num_drivers = Faker::Number.between(from: 1, to: 3)

        num_drivers.times do
          driver = LeadDriver.create!(
            lead: lead,
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            relationship: Faker::Lorem.word,
            gender: Faker::Gender.binary_type,
            marital_status: Faker::Demographic.marital_status,
            birth_date: Faker::Date.between(from: 30.years.ago, to: 18.years.ago),
            first_licensed: Faker::Number.between(from: 18, to: 30),
            education: Faker::Educator.degree,
            credit_rating: Faker::Business.credit_card_type,
            bankruptcy: Faker::Boolean.boolean,
            occupation: Faker::Job.title,
            good_student: Faker::Boolean.boolean,
            license_status: Faker::Lorem.word,
            suspended_reason: Faker::Lorem.word,
            license_state: Faker::Address.state_abbr,
            sr_22: Faker::Boolean.boolean,
          )

          num_vehicles = Faker::Number.between(from: 1, to: 2)

          num_vehicles.times do
            LeadVehicle.create!(
              lead: lead,
              lead_driver: driver,
              year: Faker::Vehicle.year,
              make: Faker::Vehicle.make,
              model: Faker::Vehicle.model,
              submodel: Faker::Vehicle.style,
              vin: Faker::Vehicle.vin,
              alarm: Faker::Boolean.boolean,
              primary_purpose: Faker::Vehicle.car_type,
              average_mileage: Faker::Number.between(from: 5000, to: 20000),
              commute_days_per_week: Faker::Number.between(from: 1, to: 5),
              annual_mileage: Faker::Vehicle.mileage,
              ownership: Faker::Vehicle.license_plate,
              collision: Faker::Vehicle.transmission,
              comprehensive: Faker::Vehicle.fuel_type,
            )
          end

          num_violations = Faker::Number.between(from: 0, to: 2)

          num_violations.times do
            LeadViolation.create!(
              lead: lead,
              lead_driver: driver,
              violation_type: Faker::Lorem.word,
              incident_date: Faker::Date.between(from: 3.years.ago, to: 1.day.ago),
              description: Faker::Lorem.sentence,
              what_damaged: Faker::Lorem.word,
              accident_at_fault: Faker::Boolean.boolean,
              claim_at_fault: Faker::Boolean.boolean,
              amount_paid: Faker::Number.decimal(l_digits: 3, r_digits: 2),
              dui_state: Faker::Address.state_abbr,
            )
          end
        end
      end
    end
    puts "Database populated successfully ok!"
  end
end
