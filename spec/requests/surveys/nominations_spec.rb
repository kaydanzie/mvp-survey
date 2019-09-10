require 'rails_helper'

RSpec.describe "Nominations", type: :request do
  let(:survey) { create(:survey) }

  before { sign_in create(:admin) }

  it "renders new" do
    get survey_nomination_path(survey)
    expect(response).to have_http_status(:ok)
  end

  describe "#create" do
    let(:params) { { nomination: { nominee_id: create(:user).id } } }

    it "re-renders form on error" do
      params[:nomination][:nominee_id] = nil
      post survey_nominations_path(survey), params: params
      expect(response).to render_template(:new)
    end

    it "redirects to surveys page" do
      post survey_nominations_path(survey), params: params
      expect(response).to redirect_to(surveys_path)
    end

    it "creates a record" do
      expect { post survey_nominations_path(survey), params: params }
        .to change(Nomination, :count).by(1)
    end
  end
end
