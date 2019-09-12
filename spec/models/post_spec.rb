# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Testing Post Model' do
    let(:user) { create(:user) }
    let(:post) { build(:post) }

    it 'Validating body' do
      post.body = nil
      post.user = user
      expect(post.save).to eq(false)
    end

    it 'Validating User presence' do
      post.user = nil
      expect(post.save).to eq(false)
    end
  end
end
