class NominationsController < ApplicationController
  # POST /nominations
  def create
    @nomination = Nomination.new(nomination_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to surveys_path, notice: 'Successfully submitted nomination.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def nomination_params
    params.require(:nomination).permit(:user_id, :survey_id, :comments, :nominee_id)
  end
end
