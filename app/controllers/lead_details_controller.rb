class LeadDetailsController < ApplicationController
  layout "admin"
  before_action :require_login

  def index
  end

  def show
    # @lead = Lead.includes(:lead_detail, :lead_drivers, :lead_vehicles, :lead_violations).find_by(id: params[:id])
    @lead = Lead.find(params[:id])
    @lead_detail = @lead.lead_detail
    @lead_drivers = @lead.lead_drivers
    @lead_vehicles = @lead.lead_vehicles
    @lead_violations = @lead.lead_violations
  end
end
