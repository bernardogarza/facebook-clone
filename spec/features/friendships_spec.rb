require 'rails_helper'

RSpec.feature "Friendships", type: :feature do
  context 'Testing Friendships Controller' do
    before(:each) do
      User.create(first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.com', password: '123456', password_confirmation: '123456')
      User.create(first_name: 'Bar', last_name: 'Foo', email: 'bar@foo.com', password: '123456', password_confirmation: '123456')
    end
    
    let(:log_in) do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'foo@bar.com'
        fill_in 'Password', with: '123456'
        click_button 'Log in'
      end
    end

    let(:log_in2) do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'bar@foo.com'
        fill_in 'Password', with: '123456'
        click_button 'Log in'
      end
    end

    let(:friend_request) do
      log_in
      click_on 'Users'
      click_on 'Bar Foo'
      click_on 'Send Friend Request'
    end

    scenario 'Should send friend request' do
      friend_request
      expect(page).to have_content('You already sent a friend request')
    end

    scenario 'Accept friend request' do
      friend_request
      click_on 'Log out'
      log_in2
      click_on 'Friends / Requests'
      click_on 'Accept'
      expect(page).to have_content('You and Foo Bar are friends now')
    end

    scenario 'Ignore friend request' do
      friend_request
      click_on 'Log out'
      log_in2
      click_on 'Friends / Requests'
      click_on 'Ignore'
      expect(page).to have_content('You ignored the friend request')
    end
  end
end
