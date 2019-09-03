require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'Tesing Users Controllers' do
    let(:user) { create(:user) }
    scenario 'It has to show all users' do
      visit users_path
      expect(page).to have_content('assa')
    end
  end
end
