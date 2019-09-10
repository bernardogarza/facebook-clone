require 'rails_helper'

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  provider: 'facebook',
  info: {
    first_name: 'first',
    last_name: 'last',
    email: 'foo@bar.com'
  }
})

feature 'OmniAuth Signup' do

  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  scenario 'can sign up via facebook' do
    visit '/'
    click_link 'Sign in with Facebook'
    expect(page).to have_content('Successfully authenticated from Facebook account.')
  end
end