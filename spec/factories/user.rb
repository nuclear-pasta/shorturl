FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "user+#{n}@test.com" }
        password { 'Password1234!' }
        password_confirmation { 'Password1234!' }
    end
  end
