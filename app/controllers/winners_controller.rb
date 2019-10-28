class Surveys::WinnersController < ApplicationController
  load_and_authorize_resource
  before_action :set_survey

  def create

  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def winner_params
    params.require(:winner).permit(:user_id).merge(survey_id: @survey&.id)
  end
end
