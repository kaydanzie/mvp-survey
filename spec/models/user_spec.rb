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
    let(:user) { build(:user, role: nil, office: nil) }
    before {
      allow(user).to receive(:initialize_user).and_call_original
    }

    it 'sets role to "employee" after creation' do
      expect { user.save }.to change { user.role }.to("employee")
    end

    it 'sets office to "Grand Rapids" after creation' do
      expect { user.save }.to change { user.office }.to("Grand Rapids")
    end
  end
end
