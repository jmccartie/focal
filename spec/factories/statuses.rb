# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status do
    body Faker::Lorem.paragraphs.join("\n")
  end
end
