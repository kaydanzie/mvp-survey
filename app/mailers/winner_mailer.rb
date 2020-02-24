class WinnerMailer < ApplicationMailer
  def winner_email(winner_id, survey_id)
    @winner = Winner.find(winner_id)
    @survey = Survey.find(survey_id)

    mail to: User.pluck(:email), subject: "New MVP"
  end
end
