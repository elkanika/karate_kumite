class Match < ApplicationRecord
  belongs_to :category
  belongs_to :competitor1, class_name: 'Competitor'
  belongs_to :competitor2, class_name: 'Competitor'
  belongs_to :winner, class_name: 'Competitor', optional: true
end
