require 'rails_helper'

RSpec.describe 'Initial Login', type: :system do
  context 'with an FFI email address' do
    before {
      stub_omniauth(email: "ruby@formulafolios.com")
      visit root_url
    }

    it 'creates user' do
      # Assume
      expect(User.count).to eq 0
      expect(page).to have_content('Login')

      # Act
      click_on 'Login'

      # Assert
      expect(User.all).not_to be_empty
    end

    it 'redirects to office selection page' do
      # Act
      click_on 'Login'

      # Assert
      expect(page).to have_current_path(/office/)
      expect(page).to have_content("Select which office you're in")
    end
  end

  context 'without an FFI email address' do
    before {
      stub_omniauth(email: "johndoe@gmail.com")
      visit root_url
    }

    it 'redirects to home page' do
      # Assume
      expect(page).to have_content('Login')

      # Act
      click_on 'Login'

      # Assert
      expect(page).to have_current_path("/")
    end

    it "doesn't create a user" do
      # Act
      click_on 'Login'

      # Assert
      expect(User.all).to be_empty
    end

    it "displays flash error" do
      # Act
      click_on 'Login'

      # Assert
      expect(page).to have_content("Please log in with an FFI email address")
    end
  end
end
