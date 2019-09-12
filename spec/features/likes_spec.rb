# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  context 'Testing Likes Controllers' do
    before(:each) do
      User.create(first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.com', password: '123456', password_confirmation: '123456')
    end

    let(:log_in) do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'foo@bar.com'
        fill_in 'Password', with: '123456'
        click_button 'Log in'
      end
    end

    let(:create_post) do
      within('form') do
        fill_in 'post_body', with: 'This is a post'
        click_button 'Post'
      end
    end

    let(:like_post) do
      log_in
      create_post
      click_on 'Like'
    end

    scenario 'Should like a post' do
      like_post
      expect(page).to have_content('Unlike')
    end

    scenario 'Should unlike a post' do
      like_post
      click_on 'Unlike'
      expect(page).to have_content('Like')
    end
  end
end
