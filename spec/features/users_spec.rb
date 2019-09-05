require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'Tesing Users Controllers' do
    let(:log_in) { 
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'foo@bar.com'
        fill_in 'Password', with: '123456'
        click_button 'Log in'
      end
    }

    before(:each) do
      user = User.create(first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.com', password: '123456', password_confirmation: '123456')
      user2 = User.create(first_name: 'Bar', last_name: 'Foo', email: 'bar@foo.com', password: '123456', password_confirmation: '123456')
    end

    scenario 'It has to ask you to sign in or log in to access other parts of the site' do
      visit users_path
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end

    scenario 'Log in success' do
      log_in
      expect(page).to have_content('Signed in successfully')
    end

    scenario 'Log out success' do
      log_in
      click_on 'Log out'
      expect(page).to have_content('Signed out successfully.')
    end

    scenario 'Show all users' do
      log_in
      visit users_path
      expect(page).to have_content('Bar Foo')
    end

    scenario 'Visit users profile' do
      log_in
      visit users_path
      click_on 'Bar Foo'
      expect(page).to have_content("Bar Foo's Profile")
    end
  end
end
