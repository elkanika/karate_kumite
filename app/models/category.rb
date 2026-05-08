class Category < ApplicationRecord
  belongs_to :tournament
  enum :modality, { kata: 0, kumite: 1 }

  has_many :enrollments
  has_many :competitors, through: :enrollments
  has_many :matches
end
