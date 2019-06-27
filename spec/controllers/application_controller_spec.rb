require 'rails_helper'

RSpec.describe ApplicationController do
  controller do
    def index; end
  end

  describe '#require_login' do
    it 'redirects if not logged in' do
      # Act
      get :index

      # Assert
      expect(response).not_to be_successful
      expect(response).to redirect_to(root_url)
      expect(controller).to set_flash[:error]
    end

    it 'returns nil if logged in' do
      # Arrange
      sign_in create(:user)

      # Assert
      expect(controller.require_login).to be_nil
    end
  end

  describe '#authorize_admin' do
    it 'returns nil if admin' do
      # Arrange
      sign_in create(:admin)

      # Assert
      expect(controller.authorize_admin).to be_nil
    end

    it 'shows error unless admin' do
      # Arrange
      allow(controller).to receive(:redirect_to)

      # Act
      controller.authorize_admin

      # Assert II
      expect(controller).to set_flash[:error].to(/must be an admin/)
      expect(controller).to have_received(:redirect_to).with(root_url)
    end
  end

  describe '#authorize_user' do
    it 'returns nil if user has valid role' do
      user = create(:user)

      User::ROLES.each do |role|
        # Arrange
        user.update(role: role)
        sign_in user

        # Assert
        expect(controller.authorize_user).to be_nil, "expected #{role} to be a valid role"
      end
    end

    it 'shows error if invalid role' do
      # Arrange
      sign_in create(:user, role: "Goat")
      allow(controller).to receive(:redirect_to)

      # Act
      controller.authorize_user

      # Assert II
      expect(controller).to set_flash[:error].to(/must have a valid user role/)
      expect(controller).to have_received(:redirect_to).with(root_url)
    end
  end
end
