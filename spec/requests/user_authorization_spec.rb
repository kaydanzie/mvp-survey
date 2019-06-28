require 'rails_helper'

RSpec.describe "User authorization", type: :request do
  context 'when not logged in' do
    it 'redirects to home page' do
      get users_url
      expect(response).to redirect_to(root_url)
    end

    it 'displays flash error message' do
      get users_url
      expect(flash[:error]).to match("must be logged in")
    end

    # Anyone should be able to view the home page
    it 'renders home page' do
      get root_url
      expect(response).to be_successful
      expect(response.body).to include("Welcome")
    end
  end

  context 'when not authorized' do
    let(:non_admin) { create(:user, role: 'employee') }

    before { sign_in non_admin }

    it 'redirects to home page' do
      get edit_user_url(non_admin)
      expect(response).to redirect_to(root_url)
    end

    it 'displays flash error message' do
      get edit_user_url(non_admin)
      expect(flash[:error]).to match("not authorized")
    end
  end
end
