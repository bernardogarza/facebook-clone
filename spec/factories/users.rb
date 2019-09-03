FactoryBot.define do
    factory :user do
        first_name 'Foo'
        last_name 'Bar'
        email 'foo@bar.com'
        password '123456'
        password_confirmation '123456'
    end

    factory :random_user, class: User do
        first_name { Faker::Name.first_name }
        last_name { Faker::Name.last_name }
        email { Faker::Internet.safe_email }
        password '123456'
        password_confirmation '123456'
    end
end