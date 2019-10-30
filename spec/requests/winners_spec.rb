require 'rails_helper'

RSpec.describe "Winners", type: :request do
  let(:survey) { create(:survey) }

  before { sign_in create(:admin) }

  it "renders new" do
    get new_survey_winner_path(survey)
    expect(response).to have_http_status(:ok)
  end

  describe "#create" do
    let(:params) { { winner: { user_id: User.last.id } } }

    it "re-renders form on error" do
      params[:winner][:user_id] = nil
      post survey_winners_path(survey), params: params
      expect(response).to render_template(:new)
    end

    it "redirects to surveys page" do
      post survey_winners_path(survey), params: params
      expect(response).to redirect_to(surveys_path)
    end

    it "creates a record" do
      expect { post survey_winners_path(survey), params: params }
        .to change(Winner, :count).by(1)
    end
  end
end
