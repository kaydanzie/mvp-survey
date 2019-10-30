module SurveysHelper
  def formatted_nomination(nomination)
    return "Nominated by #{nomination.user.full_name}" if nomination.comments.blank?

    "\"#{nomination.comments}\" - nominated by #{nomination.user.full_name}"
  end

  def nomination_message(my_nomination, survey)
    return "You nominated #{my_nomination.nominee.full_name}" if my_nomination
    return if survey.winner

    voting_link = link_to "(Vote Here)", new_survey_nomination_path(survey)
    safe_join(["You haven't nominated anyone for this survey ", voting_link])
  end
end
