require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Testing User model' do
    let(:user) { create(:user) }
    it 'Validating user first name presence' do
      user.first_name = nil
      expect(user.save).to eq(false)
    end
  end
end
