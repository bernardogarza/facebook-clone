# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Testing User model' do
    let(:user) { build(:user) }
    it 'Validating user first name presence' do
      user.first_name = nil
      expect(user.save).to eq(false)
    end

    it 'Validating user last name presence' do
      user.last_name = nil
      expect(user.save).to eq(false)
    end

    it 'Validating user email presence' do
      user.email = nil
      expect(user.save).to eq(false)
    end

    it 'Validating user password presence' do
      user.password = nil
      expect(user.save).to eq(false)
    end

    it 'Validating user password confirmation presence' do
      user.password_confirmation = nil
      expect(user.save).to eq(false)
    end

    it 'Validating user password match' do
      user.password_confirmation = '123'
      expect(user.save).to eq(false)
    end
  end
end
