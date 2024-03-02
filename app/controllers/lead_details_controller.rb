class LeadDetailsController < ApplicationController
  layout "admin"
  before_action :require_login

  def index
  end

  def show
    # @names = ["home_garage", "home_owner", "home_length", "interested_in_home_insurance", "interested_in_condo_insurance", "interested_in_life_insurance", "interested_in_renters_insurance", "interested_in_usage_based_policy", "currently_insured", "current_company", "current_customer", "continuous_coverage", "current_policy_expiration_date", "military_affiliation"]
    # @lead_detail = LeadDetail.find_by(lead_id: params[:id])
    @lead = Lead.includes(:lead_detail, :lead_drivers, :lead_vehicles, :lead_violations).find_by(id: params[:id])
    @lead_detail = @lead.lead_detail
    @lead_drivers = @lead.lead_drivers
    @lead_vehicles = @lead.lead_vehicles
    @lead_violations = @lead.lead_violations
  end
end
