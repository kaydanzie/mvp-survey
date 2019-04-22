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
end
