require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  context 'Testing Comments Controllers' do
    let(:log_in) { 
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'foo@bar.com'
        fill_in 'Password', with: '123456'
        click_button 'Log in'
      end
    }

    let(:create_post) {
      log_in
      within('form') do
        fill_in 'post_body', with: 'This is a post'
        click_button 'Post'
      end
    }

    let(:create_comment) {
      create_post
      within('form') do
        fill_in 'comment_body', with: 'This is a comment'
        click_button 'Comment'
      end
    }

    scenario 'Should create a comment' do
      create_post
      expect(page).to have_content('Your comment was successfully posted')
    end
  end
end
