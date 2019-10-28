class WinnersController < ApplicationController
  load_and_authorize_resource
  before_action :set_survey

  # POST /surveys/:survey_id/winners
  def create
    @winner = Winner.new(winner_params)

    respond_to do |format|
      if @winner.save
        format.html {
          redirect_to surveys_path, notice: "Selected #{@winner.user.full_name} as MVP!"
        }
      else
        format.html { render 'nominations/index' }
      end
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def winner_params
    params.require(:winner).permit(:user_id).merge(survey_id: @survey&.id)
  end
end
