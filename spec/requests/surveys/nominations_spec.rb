require 'rails_helper'

RSpec.describe "Nominations", type: :request do
  let(:survey) { create(:survey) }

  before { sign_in create(:admin) }

  it "renders new" do
    get survey_nomination_path(survey)
    expect(response).to have_http_status(:ok)
  end

  it "re-renders form on error" do
    post survey_nominations_path(survey), params: { nomination: { nominee_id: nil } }
    expect(response).to render_template(:new)
  end
end
