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

  it 'sets role to "employee" after creation' do
    user = build(:user, role: nil)
    expect(user).to receive(:initialize_role).and_call_original
    expect { user.save }.to change { user.role }.to("employee")
  end
end
