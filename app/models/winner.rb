class Winner < ApplicationRecord
  validates :user_id, presence: true
  validates :survey_id, uniqueness: true

  belongs_to :user
  belongs_to :survey

  after_create :send_winner_announcement

  def send_winner_announcement
    WinnerMailer.winner_email(id, survey.id).deliver_later
  end
end
