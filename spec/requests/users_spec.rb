require 'rails_helper'

RSpec.describe "Users", type: :request do
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
    expect(response.body).to include("Editing")
  end

  it 'renders office' do
    get office_user_url(admin)
    expect(response).to be_successful
    expect(response.body).to include("Office")
  end

  describe '#update' do
    let(:user_params) { { user: { office: "Costa Mesa" } } }

    context 'when coming from the index' do
      let(:headers) { { 'HTTP_REFERER' => users_path } }

      it 'redirects to user index' do
        put user_path(admin), params: user_params, headers: headers
        expect(response).to redirect_to(users_url)
      end

      it 'displays flash notice' do
        put user_path(admin), params: user_params, headers: headers
        expect(flash[:notice]).to match("Successfully updated")
      end
    end

    context 'when coming from the office page' do
      let(:headers) { { 'HTTP_REFERER' => office_user_path(admin) } }

      it 'redirects to survey index' do
        put user_path(admin), params: user_params, headers: headers
        expect(response).to redirect_to(surveys_url)
      end

      it 'displays flash notice' do
        put user_path(admin), params: user_params, headers: headers
        expect(flash[:notice]).to match("Welcome")
      end
    end
  end
end
