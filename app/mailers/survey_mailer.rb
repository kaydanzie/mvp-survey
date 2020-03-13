class SurveyMailer < ApplicationMailer
  def nominate_email(survey_id)
    @survey = Survey.find(survey_id)

    User.pluck(:email).each do |email|
      mail to: email, subject: "Time to nominate!"
    end
  end
end
