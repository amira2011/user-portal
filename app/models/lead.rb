class Lead < ApplicationRecord
  belongs_to :user
  has_one :lead_detail, dependent: :destroy
  paginates_per 10

  def contact
    "#{first_name} #{last_name}"
  end

  def complete_address
    "#{address} , #{address2} "
  end
end
