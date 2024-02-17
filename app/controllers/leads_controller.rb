class LeadsController < ApplicationController
  layout "admin"

  def index
    @leads = current_user.leads.page(params[:page])
  end
end
