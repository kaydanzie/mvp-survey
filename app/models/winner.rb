class Winner < ApplicationRecord
  validates :user_id, presence: true
  validates :survey_id, uniqueness: true

  belongs_to :user
  belongs_to :survey
end
