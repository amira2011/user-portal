class LeadDriver < ApplicationRecord
  belongs_to :lead
  has_many :lead_vehicles
  has_many :lead_violations

  VALID_RELATIONSHIPS = [
    "self",
    "spouse",
    "parent",
    "sibling",
    "child",
    "grandparent",
    "grandchild",
    "domestic partner",
    "other",
  ].freeze
  #   validates :relationship, inclusion: { in: VALID_RELATIONSHIPS, message: "%{value} is not a valid relationship" }
end
