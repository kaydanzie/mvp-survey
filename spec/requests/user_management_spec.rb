require 'rails_helper'

RSpec.describe "User management", type: :request do
  let(:admin) { create(:admin) }

  before { sign_in admin }

  it 'renders index' do
    get users_url
    expect(response).to be_successful
    expect(response.body).to include("All Employees")
  end

  it 'renders edit' do
    get edit_user_url(admin), xhr: true
    expect(response).to be_successful
    expect(response.body).to include("Edit User")
  end

  describe '#update' do
    let(:user_params) { { user: { office: "Costa Mesa" } } }

    it 'redirects to index' do
      put user_path(admin), params: user_params
      expect(response).to redirect_to(users_url)
    end

    it 'displays flash notice' do
      put user_path(admin), params: user_params
      expect(flash[:notice]).to match("successfully updated")
    end
  end
end
