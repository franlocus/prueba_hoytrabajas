FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "worker-#{n}@mail.com"
    end
    password { '12345678' }
  end
end
