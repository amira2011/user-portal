class Lead < ApplicationRecord
  belongs_to :user
  has_one :lead_detail, dependent: :destroy

  def contact
    "#{first_name} #{last_name}"
  end

  def complete_address
    "#{address} , #{address2} "
  end
end
