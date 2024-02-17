class LeadDetailsController < ApplicationController
  def index
  end

  def show
    @names = ["home_garage", "home_owner", "home_length", "interested_in_home_insurance", "interested_in_condo_insurance", "interested_in_life_insurance", "interested_in_renters_insurance", "interested_in_usage_based_policy", "currently_insured", "current_company", "current_customer", "continuous_coverage", "current_policy_expiration_date", "military_affiliation"]
    @lead_detail = LeadDetail.find_by(lead_id: params[:id])
    puts "ok"
  end
end
