class Surveys::NominationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_survey

  # GET /surveys/:survey_id/nominate
  def new; end

  # POST /surveys/:survey_id/nominations
  def create
    params[:nomination][:user_id] = current_user.id
    @nomination = Nomination.new(nomination_params)

    respond_to do |format|
      if @nomination.save
        format.html { redirect_to surveys_path, notice: 'Successfully submitted nomination.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def nomination_params
    params.require(:nomination).permit(:user_id, :survey_id, :comments, :nominee_id)
  end
end
