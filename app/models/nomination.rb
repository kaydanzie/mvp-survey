class Nomination < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  belongs_to :nominee, class_name: 'User'

  validates :nominee_id, presence: { message: 'You must choose an employee to nominate' }
  # Users can only nominate once per survey
  validates :survey_id, uniqueness: { scope: :user_id }
end
