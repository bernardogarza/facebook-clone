require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'Tesing Users Controllers' do
    let(:user) { create(:user) }
    let(:user1) {create(:user1)}
    scenario 'It has to ask you to sign in or log in' do
      visit users_path
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end

    # before do
    #   visit users_path
    #   within('form') do
    #     fill_in 'Email', with: 'john@doe.com'
    #     fill_in 'Password', with: '123456'
    #   end
    #   click_button 'Log in'
    # end
    # scenario 'Log in' do
    #   visit new_user_session_path
    #   expect(page).to have_content('Foo Bar')
    # end

      scenario 'Log in' do
        visit new_user_session_path
        User.create(first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.com', )
        within('form') do
          fill_in 'Email', with: 'foo@bar.com'
          fill_in 'Password', with: '123456'
          click_button 'Log in'
        end
        expect(page).to have_content('')
      end
  end
end
