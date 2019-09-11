module SurveysHelper
  def formatted_nomination(nomination)
    return "Nominated by #{nomination.user.full_name}" if nomination.comments.blank?

    "\"#{nomination.comments}\" - nominated by #{nomination.user.full_name}"
  end
end
