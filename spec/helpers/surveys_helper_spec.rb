require 'rails_helper'

RSpec.describe SurveysHelper do
  describe '#formatted_nomination' do
    it 'returns name and comment' do
      # Arrange
      nomination = create(:nomination, comments: "Not bad, solid 5")

      # Act
      formatted = helper.formatted_nomination(nomination)

      # Assert
      expect(formatted).to match(nomination.user.full_name)
      expect(formatted).to match(nomination.comments)
    end

    it 'returns just the user name if no comments' do
      # Arrange
      nomination = create(:nomination)

      # Act
      formatted = helper.formatted_nomination(nomination)

      # Assert
      expect(formatted).to match("Nominated by #{nomination.user.full_name}")
    end
  end
end
