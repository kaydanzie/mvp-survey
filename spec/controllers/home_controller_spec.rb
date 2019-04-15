require 'rails_helper'

RSpec.describe HomeController do
  it 'renders index' do
    get :index
    expect(response).to be_successful
  end
end
