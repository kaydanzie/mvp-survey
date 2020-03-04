class WinnerMailer < ApplicationMailer
  def winner_email(winner_id, survey_id)
    @winner = Winner.find(winner_id)
    @survey = Survey.find(survey_id)

    User.pluck(:email).each do |email|
      mail to: email, subject: "New MVP"
    end
  end
end
