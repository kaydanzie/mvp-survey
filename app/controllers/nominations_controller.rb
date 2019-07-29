class NominationsController < ApplicationController
  # POST /nominations
  def create
    params[:nomination][:user_id] = current_user.id
    @nomination = Nomination.new(nomination_params)

    respond_to do |format|
      if @nomination.save
        format.html { redirect_to surveys_path, notice: 'Successfully submitted nomination.' }
      else
        format.html { render 'surveys/nominate' }
      end
    end
  end

  private

  def nomination_params
    params.require(:nomination).permit(:user_id, :survey_id, :comments, :nominee_id)
  end
end
