require 'rails_helper'

RSpec.describe 'Initial Login', type: :system do
  before {
    stub_omniauth
    visit root_url
  }

  it 'creates user' do
    # Assume
    expect(User.count).to eq 0
    expect(page).to have_content('Login')

    # Act
    click_on 'Login'

    # Assert
    expect(User.count).to eq 1
  end

  it 'redirects to office selection page' do
    # Act
    click_on 'Login'

    # Assert
    expect(page).to have_current_path(/office/)
    expect(page).to have_content("Select which office you're in")
  end
end
