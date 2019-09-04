FactoryBot.define do
  factory :friendship do
    user { nil }
    friend { nil }
    confirm { false }
  end
end
