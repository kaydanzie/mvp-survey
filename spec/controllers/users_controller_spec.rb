require 'rails_helper'

RSpec.describe UsersController do
  let(:admin) { create(:super_admin) }
  before { sign_in admin }

  it 'renders index' do
    get :index
    expect(response).to be_successful
  end

  it 'redirects after update' do
    # Arrange
    non_admin = create(:user)

    # Act
    patch :update, params: { id: non_admin, user: { role: "employee" } }

    # Assert
    expect(controller).to redirect_to(users_url)
    expect(controller).to set_flash[:notice]
  end
end
