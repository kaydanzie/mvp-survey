require 'rails_helper'

RSpec.describe Nomination do
  subject(:nomination_subject) { create(:nomination) }

  describe '#validations' do
    it "can't nominate self" do
      # Arrange
      user = create(:user)
      nomination = build(:nomination, user: user, nominee: user)

      # Assert
      expect(nomination).not_to be_valid
      expect(nomination.errors[:nominee_id]).not_to be_empty
    end

    it { expect(nomination_subject).to validate_uniqueness_of(:survey_id).scoped_to(:user_id) }
    it {
      expect(nomination_subject).to validate_presence_of(:nominee_id)
        .with_message("You must choose an employee to nominate")
    }
  end
end
