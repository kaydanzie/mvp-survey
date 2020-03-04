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

    it "displays link when user hasn't nominated" do
      get survey_path(survey)
      expect(response.body).to include("Nominate Here")
    end

    it 'displays message when user has nominated' do
      # Arrange
      create(:nomination, survey: survey, user: admin)

      # Act
      get survey_path(survey)

      # Assert
      expect(response.body).to include("Your Nomination")
    end

    it "shows winner's name when chosen" do
      # Arrange
      create(:winner, survey: survey)

      # Act
      get survey_path(survey)

      # Assert
      expect(response.body).to include("Winner:")
    end

    it "doesn't show Employee Nominations" do
      # Arrange
      sign_in create(:user)

      # Act
      get survey_path(survey)

      # Assert
      expect(response.body).not_to include("See All Nominations")
    end

    describe '#admin' do
      it "shows link to employee nominations" do
        get survey_path(survey)
        expect(response.body).to include("See All Nominations")
      end
    end
  end
end
