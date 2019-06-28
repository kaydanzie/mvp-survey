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
