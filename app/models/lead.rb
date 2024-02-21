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

  def self.search(value)
    where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR phone LIKE ? OR address LIKE ? OR address2 LIKE ? OR city LIKE ? OR state LIKE ? OR zip LIKE ? ", "%#{value}%", "%#{value}%", "%#{value}%", "%#{value}%", "%#{value}%", "%#{value}%", "%#{value}%", "%#{value}%", "%#{value}%")
  end
end
