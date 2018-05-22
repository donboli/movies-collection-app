FactoryBot.define do
  factory :movie do
    name     { Faker::Book.title }
    synopsis { Faker::Lorem.paragraph }
    rating   { rand(5) }
    director { Faker::Book.author }
    actors   { (rand(3) + 2).times.map { Faker::Book.author }.join(', ') }
  end
end
