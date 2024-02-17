class LeadsController < ApplicationController
  def index
    @leads = current_user.leads.page(params[:page])
  end
end
