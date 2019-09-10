require 'rails_helper'

RSpec.describe "User authorization", type: :request do
  # Logged out user
  describe "Guest" do
    before { logout }

    context 'without permission' do
      it 'redirects to home page' do
        get surveys_path
        expect(response).to redirect_to(root_path)
      end

      it 'displays error message' do
        get users_path
        expect(controller).to set_flash[:error].to(/You must be logged in/)
      end
    end
  end

  describe "No Role" do
    before { sign_in create(:user, role: "") }

    context 'without permission' do
      it 'redirects to home page' do
        get users_path
        expect(response).to redirect_to(root_path)
      end

      it 'displays error message' do
        get surveys_path
        expect(controller).to set_flash[:error].to(/not authorized/)
      end
    end
  end

  describe "Admin" do
    before { sign_in create(:admin) }

    it 'renders page' do
      get edit_user_path(User.last), xhr: true
      expect(response).to be_successful
    end
  end

  describe "Employee" do
    before { sign_in create(:user) }

    it 'renders page' do
      get surveys_path
      expect(response).to be_successful
    end

    context 'without permission' do
      it 'redirects to home page' do
        get edit_user_path(User.last)
        expect(response).to redirect_to(root_path)
      end

      it 'displays error message' do
        get edit_user_path(User.last)
        expect(controller).to set_flash[:error].to(/not authorized/)
      end
    end
  end
end
