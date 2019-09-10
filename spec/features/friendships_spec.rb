require 'rails_helper'

RSpec.feature "Friendships", type: :feature do
  context 'Testing Friendships Controller' do
    before(:each) do
      user = User.create(first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.com', password: '123456', password_confirmation: '123456')
      user2 = User.create(first_name: 'Bar', last_name: 'Foo', email: 'bar@foo.com', password: '123456', password_confirmation: '123456')
    end
    
    let(:log_in) do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'foo@bar.com'
        fill_in 'Password', with: '123456'
        click_button 'Log in'
      end
    end

    scenario 'Should send friend request' do
      log_in
      click_on 'Users'
      click_on 'Bar Foo'
      click_on 'Send Friend Request'
      
    end
  end
end
