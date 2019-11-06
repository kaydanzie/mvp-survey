require 'rails_helper'

RSpec.describe User do
  describe '#validations' do
    it 'validates FFI email address' do
      # Arrange
      user = create(:user, email: 'ssinclair@formulafolios.com')

      # Assume
      expect(user).to be_valid

      # Arrange II
      user.email = "bobross@aol.com"

      # Assert
      expect(user).not_to be_valid
      expect(user.errors[:email]).not_to be_empty
    end
  end

  describe '#initialize_user' do
    let(:user) { build(:user, role: nil) }

    it 'sets role to "employee" after creation' do
      expect { user.save }.to change(user, :role).to("employee")
    end
  end

  describe '#surveys_with_nominations' do
    let(:user) { create(:user) }

    it 'returns surveys user was nominated for' do
      nominated_survey = create(:nomination, nominee: user).survey
      expect(user.surveys_with_nominations).to include(nominated_survey)
    end

    it "doesn't return surveys without nominations" do
      survey_without_nomination = create(:survey)
      expect(user.surveys_with_nominations).not_to include(survey_without_nomination)
    end
  end

  describe '#voted?' do
    it 'returns true if user nominated someone in the given survey' do
      # Arrange
      user = create(:user)
      nomination = create(:nomination, user: user)

      # Assert
      expect(user.voted?(nomination.survey)).to be_truthy
    end
  end
end
