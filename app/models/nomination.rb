class Nomination < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  belongs_to :nominee, class_name: 'User'

  # Users can only nominate once per survey
  validates :survey_id, uniqueness: { scope: :user_id }
  validates :nominee_id, presence: { message: 'You must choose an employee to nominate' }
  validate :no_self_nominating
  validate :no_winner

  def no_self_nominating
    errors.add(:nominee_id, "You can't nominate yourself!") if nominee_id == user_id
  end

  def no_winner
    return unless Winner.find_by(survey_id: survey_id)

    errors.add(:nominee_id, "Sorry, an MVP has already been chosen. Try again next month!")
  end
end
