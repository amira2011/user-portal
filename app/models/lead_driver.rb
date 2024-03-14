class LeadDriver < ApplicationRecord
  belongs_to :lead
  has_many :lead_vehicles
  has_many :lead_violations

  VALID_RELATIONSHIPS = ["self", "spouse", "parent", "sibling", "child", "grandparent", "grandchild", "domestic partner", "other"].freeze
  #   validates :relationship, inclusion: { in: VALID_RELATIONSHIPS, message: "%{value} is not a valid relationship" }
  VALID_EDUCATION = ['None', 'High School', 'GED', 'Incomplete', 'Some College', 'Vocational', 'Associate', 'Bachelor', 'Master', 'PhD', 'Law', 'Unknown', 'Other Nonprofessional Degree', 'Other Professional Degree'].freeze
  # validates :education, inclusion: {in: VALID_EDUCATION, message: "%{value} is not a valid education."}
  VALID_CREDIT_RATING = ['Excellent', 'Good', 'Average', 'Below average', 'Poor'].freeze
  VALID_OCCUPATION = ['Administrative Clerical', 'Architect', 'Business Owner', 'Certified Public Accountant', 'Clergy', 'Construction Trades', 'Consultant', 'Dentist', 'Disabled', 'Engineer', 'Financial Services', 'Health Care', 'Homemaker', 'Human Relations', 'Lawyer', 'Marketing', 'Manager Supervisor', 'Military Enlisted', 'Minor Not Applicable', 'Other Not Listed', 'Other Non Technical', 'Other Technical', 'Physician', 'Professional Salaried', 'Professor', 'Retail', 'Retired', 'Sales Inside', 'Sales Outside', 'School Teacher', 'Scientist', 'Self Employed', 'Skilled Semi Skilled', 'Student', 'Transportation or Logistics', 'Unemployed'].freeze
  VALID_LICENSE_STATUS = ['Active', 'Expired', 'International', 'Learner', 'None', 'Other', 'Permit', 'Probation', 'Restricted', 'Revoked', 'Suspended', 'Temporary'].freeze
  VALID_SUSPENDED_REASON = ['Failure to pay ticket', 'DUI', 'Received too many tickets', 'No insurance', 'Other'].freeze
  VALID_MARITAL_STATUS = ['Single', 'Married', 'Divorced', 'Separated', 'Widowed', 'Domestic Partner', 'Unknown'].freeze







end
