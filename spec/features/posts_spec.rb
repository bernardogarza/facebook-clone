require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  context 'Testing Post Controllers' do
    before(:each) do
      user = User.create(first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.com', password: '123456', password_confirmation: '123456')
    end
  
    let(:log_in) { 
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'foo@bar.com'
        fill_in 'Password', with: '123456'
        click_button 'Log in'
      end
    }
  
    scenario 'Create a post' do
      log_in
      within('form') do
        fill_in 'post_body', with: 'This is a post'
        click_button 'Post'
      end
      expect(page).to have_content('This is a post')
    end
  end
end
