require 'rails_helper'

RSpec.describe SurveysHelper do
  let(:nomination) { build(:nomination) }

  describe '#formatted_nomination' do
    it 'returns name and comment' do
      # Act
      formatted = helper.formatted_nomination(nomination)

      # Assert
      expect(formatted).to match(nomination.user.full_name)
      expect(formatted).to match(nomination.comments)
    end

    it 'returns just the user name if no comments' do
      # Arrange
      nomination.comments = ""

      # Act
      formatted = helper.formatted_nomination(nomination)

      # Assert
      expect(formatted).to match("Nominated by #{nomination.user.full_name}")
    end
  end

  describe "#nomination_message" do
    context "without a nomination" do
      it 'returns nil when winner has been chosen' do
        # Arrange
        winner = create(:winner)

        # Assert
        expect(helper.nomination_message(nil, winner.survey)).to be_nil
      end

      it "returns link to vote if no winner yet" do
        # Arrange
        expect(helper.nomination_message(nil, create(:survey))).to include("Vote Here")
      end
    end

    it "returns name of nominee" do
      expect(helper.nomination_message(nomination, nomination.survey)).to include("Your Nomination")
    end
  end
end
