class LeadDriversController < ApplicationController
  layout "admin"
  before_action :require_login

  def edit
    @lead_driver = LeadDriver.find(params[:id])
    respond_to do |format|
      format.js # This will look for a file named edit.js.erb
    end
  end

  def update
    @lead_driver = LeadDriver.find(params[:id])
    if @lead_driver.update(lead_driver_params)
      redirect_to @lead_driver, notice: "Lead driver was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def lead_driver_params
    params.require(:lead_driver).permit(:first_name, :last_name, :relationship, :gender, :marital_status, :birth_date, :first_licensed, :education, :credit_rating, :bankruptcy, :occupation, :good_student, :license_status, :suspended_reason, :license_state, :sr_22)
  end
end
