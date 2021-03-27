FactoryBot.define do
    factory :short_url do
        user
        original_url { 'https://guides.rubyonrails.org/'}
        sequence(:slug) { |n| "abcde#{n}" }
        description { 'RoR Documentation Website' }
    end
  end
