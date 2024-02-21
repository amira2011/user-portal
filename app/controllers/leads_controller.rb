class LeadsController < ApplicationController
  layout "admin"

  def index
    if params[:value].present?
      @leads = current_user.leads.search(params[:value]).page(params[:page])
    else
      @leads = current_user.leads.page(params[:page])
    end
  end
end
