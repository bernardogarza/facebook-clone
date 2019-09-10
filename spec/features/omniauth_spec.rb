require 'rails_helper'
OmniAuth.config.test_mode = true

RSpec.feature "Omniauths", type: :feature do
  context 'Testing Omniauth Log in' do
    before do
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
        :provider => 'facebook',
        :uid => '123545'
      })
    end
    before do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
    end

    it "sets a session variable to the OmniAuth auth hash" do
      User['uid'].expect == '123545'
    end
  end
end
