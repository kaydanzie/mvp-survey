FactoryBot.define do
  factory :nomination do
    survey
    user
    nominee { create(:random_user) }
  end
end
