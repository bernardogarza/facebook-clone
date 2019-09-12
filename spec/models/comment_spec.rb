# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Testing Comment Model' do
    let(:user) { create(:user) }

    it 'Validating body' do
      comment = user.comments.build(body: '')
      expect(comment.save).to eq(false)
    end
  end
end
