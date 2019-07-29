require 'rails_helper'

RSpec.describe "Surveys", type: :request do
  before { sign_in(create(:admin)) }

  let(:survey) { create(:survey) }

  it "renders index" do
    get surveys_path
    expect(response).to have_http_status(:ok)
  end

  it "renders edit" do
    get edit_survey_path(survey)
    expect(response).to have_http_status(:ok)
  end

  it "renders show" do
    get survey_path(survey)
    expect(response).to have_http_status(:ok)
  end
end
