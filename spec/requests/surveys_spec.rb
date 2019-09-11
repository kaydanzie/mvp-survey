require 'rails_helper'

RSpec.describe "Surveys", type: :request do
  let(:survey) { create(:survey) }
  let(:admin) { create(:admin) }

  before { sign_in admin }

  it "renders index" do
    get surveys_path
    expect(response).to have_http_status(:ok)
  end

  it "renders edit" do
    get edit_survey_path(survey)
    expect(response).to have_http_status(:ok)
  end

  describe "#show" do
    it "renders page" do
      get survey_path(survey)
      expect(response).to have_http_status(:ok)
    end

    it "displays message when user hasn't nominated" do
      get survey_path(survey)
      expect(response.body).to include("You haven't nominated anyone")
    end

    it 'displays message when user has nominated' do
      create(:nomination, survey: survey, user: admin)
      get survey_path(survey)
      expect(response.body).to include("You nominated")
    end

    it "doesn't show Employee Nominations" do
      # Arrange
      sign_in create(:user)

      # Act
      get survey_path(survey)

      # Assert
      expect(response.body).not_to include("Employee Nominations")
    end

    describe '#admin' do
      it "can see Employee Nominations" do
        get survey_path(survey)
        expect(response.body).to include("Employee Nominations")
      end
    end
  end
end
