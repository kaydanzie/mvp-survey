FactoryBot.define do
  factory :nomination do
    survey
    user
    nominee { create(:user) }
    comments { "She'll make a wonderful mother to any child who can overlook weird accents." }
  end
end
