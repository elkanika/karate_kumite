class Enrollment < ApplicationRecord
  belongs_to :competitor
  belongs_to :category
end
