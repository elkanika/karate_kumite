class Competitor < ApplicationRecord
  VALID_BELTS = %w[White Yellow Orange Green Blue Brown Black]

  validates :first_name, :last_name, :age, :belt, :dojo, presence: true
  validates :belt, inclusion: { in: VALID_BELTS, message: "%{value} is not a valid belt" }

  has_many :enrollments
  has_many :categories, through: :enrollments
end
