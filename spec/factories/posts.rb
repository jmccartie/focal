# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title Faker::Company.catch_phrase
    body Faker::Lorem.paragraphs.join("\n\n")
  end
end
