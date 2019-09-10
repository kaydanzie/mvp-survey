FactoryBot.define do
  factory :nomination do
    survey
    user
    nominee { create(:user) }
  end
end
