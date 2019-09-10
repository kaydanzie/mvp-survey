FactoryBot.define do
  factory :user do
    last_sign_in_at { Time.current }
    provider { 'google_oauth2' }
    first_name { 'Ken' }
    last_name { 'Adams' }
    role { 'employee' }
    sequence(:email) { |n| "ffi_#{n}@formulafolios.com" }

    factory :admin do
      role { 'admin' }
      email { 'admin@formulafolios.com' }
    end
  end
end
