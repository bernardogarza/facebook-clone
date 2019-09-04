require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  context 'Testing Comments Controllers' do
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

    let(:create_post) {
      log_in
      within('form') do
        fill_in 'post_body', with: 'This is a post'
        click_button 'Post'
      end
    }

    let(:create_comment) {
      create_post
      within('#comment_form') do
        fill_in 'comment_body', with: 'This is a comment'
        click_button 'Comment'
      end
    }

    scenario 'Should create a comment' do
      create_comment
      expect(page).to have_content('Your comment was successfully posted')
    end

    scenario 'Should fail to create a comment' do
      create_post
      within('#comment_form') do
        fill_in 'comment_body', with: ''
        click_button 'Comment'
      end
      expect(page).to have_content('Comment Body can\'t be blank')
    end

    scenario 'Should delete the comment' do
      create_comment
      click_on 'Delete comment'
      expect(page).to have_content('Comment successfully deleted')
    end
  end
end
