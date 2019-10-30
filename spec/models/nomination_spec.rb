require 'rails_helper'

RSpec.describe Nomination do
  describe '#validations' do
    subject(:nomination_subject) { build(:nomination) }

    it "can't nominate self" do
      # Arrange
      user = create(:user)
      nomination_subject.user = user
      nomination_subject.nominee = user

      # Assert
      expect(nomination_subject).not_to be_valid
      expect(nomination_subject.errors[:nominee_id]).not_to be_empty
    end

    it "validates no winner has been chosen" do
      # Arrange
      survey = create(:survey)
      create(:winner, survey: survey)

      # Act
      nomination_subject.survey = survey

      # Assert
      expect(nomination_subject).not_to be_valid
      expect(nomination_subject.errors[:nominee_id]).not_to be_empty
    end

    it { expect(nomination_subject).to validate_uniqueness_of(:survey_id).scoped_to(:user_id) }
    it {
      expect(nomination_subject).to validate_presence_of(:nominee_id)
        .with_message("You must choose an employee to nominate")
    }
  end
end
