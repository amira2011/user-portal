class LeadDriversController < ApplicationController
  # layout "admin"
  before_action :require_login

  def new
    @lead = Lead.find(params[:lead_id])
    @lead_driver = @lead.lead_drivers.build
    respond_to do |format|
      format.js
    end
  end

  def create
    @lead = Lead.find(params[:lead_id])
    @lead_driver = @lead.lead_drivers.build(lead_driver_params)

    respond_to do |format|
      if @lead_driver.save
        # format.html { redirect_to lead_lead_driver_path(@lead, @lead_driver), notice: "Lead driver was successfully created." }
        format.html { redirect_to lead_detail_path(id: @lead_driver.lead_id)  , notice: "Lead driver was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @lead = Lead.find(params[:lead_id])
    @lead_driver = LeadDriver.find(params[:id])
    # @lead_driver = LeadDriver.find(params[:id])
    respond_to do |format|
      format.js # This will look for a file named edit.js.erb
    end
  end

  def update
    @lead = Lead.find(params[:lead_id])
    @lead_driver = LeadDriver.find(params[:id])
    # @lead_driver = LeadDriver.find(params[:id])
    if @lead_driver.update(lead_driver_params)
      # redirect_to @lead_driver, notice: "Lead driver was successfully updated."
      redirect_to lead_detail_path(id: @lead_driver.lead_id), notice: "Driver was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def lead_driver_params
    params.require(:lead_driver).permit(:first_name, :last_name, :relationship, :gender, :marital_status, :birth_date, :first_licensed, :education, :credit_rating, :bankruptcy, :occupation, :good_student, :license_status, :suspended_reason, :license_state, :sr_22)
  end
end
