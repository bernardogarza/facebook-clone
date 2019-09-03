FactoryBot.define do
    factory :user do
        first_name {'Foo'}
        last_name {'Bar'}
        email {'foo@bar.com'}
        password {'123456'}
        password_confirmation {'123456'}
    end

    factory :user1, class: User do
        first_name {'John'}
        last_name {'Doe'}
        email {'john@doe.com'}
        password {'123456'}
        password_confirmation {'123456'}
    end
end