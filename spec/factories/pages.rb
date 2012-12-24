# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title Faker::Lorem.words.first.titleize
    # slug nil
    body Faker::Lorem.paragraphs.join("\n\n")
    sort_order 1
  end
end
