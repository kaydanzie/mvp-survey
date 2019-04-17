FactoryBot.define do
  factory :user do
    last_sign_in_at { Time.current }
    provider { 'google_oauth2' }
    first_name { 'Ken' }
    last_name { 'Adams' }
    role { 'employee' }
    email { 'kadams@formulafolios.com' }

    factory :super_admin do
      role { 'super admin' }
      email { 'super_admin@formulafolios.com' }
    end
  end
end
