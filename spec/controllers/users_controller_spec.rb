require 'rails_helper'

RSpec.describe UsersController do
  let(:user) { create(:user) }
  before { sign_in user }

  it 'renders index' do
    get :index
    expect(response).to be_successful
  end

  it 'redirects after update' do
    patch :update, params: { id: user, user: { role: "employee" } }

    expect(controller).to redirect_to(users_url)
    expect(controller).to set_flash[:notice]
  end
end
