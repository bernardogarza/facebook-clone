require 'rails_helper'

RSpec.feature "Omniauths", type: :feature do
  context 'Testing Omniauth Log in' do
    before do
      OmniAuth.config.add_mock(:facebook, {:uid => '12345'})
      visit '/auth/facebook'
    end

    it "sets a session variable to the OmniAuth auth hash" do
      session['uid'].should == '12345'
    end
  end
end
