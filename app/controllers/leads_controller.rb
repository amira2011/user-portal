class LeadsController < ApplicationController
  before_action :require_login

  def index
    @leads = Lead.all
  end
end
