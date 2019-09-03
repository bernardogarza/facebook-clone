FactoryBot.define do
    factory :user do
        first_name {'Foo'}
        last_name {'Bar'}
        email {'foo@bar.com'}
        password {'123456'}
        password_confirmation {'123456'}
    end
end