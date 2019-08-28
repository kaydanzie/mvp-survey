class Nomination < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  belongs_to :nominee, class_name: 'User'

  # Users can only nominate once per survey
  validates :survey_id, uniqueness: { scope: :user_id }
  validates :nominee_id, presence: { message: 'You must choose an employee to nominate' }
  validate :no_self_nominating

  def no_self_nominating
    errors.add(:nominee_id, "You can't nominate yourself!") if nominee_id == user_id
  end
end
