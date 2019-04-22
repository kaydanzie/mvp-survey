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
end
