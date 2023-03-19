FactoryBot.define do
  factory :municipe do
    sequence(:full_name) { |n| "full_name#{n}" }
    sequence(:cpf) { |n| "MyString#{n}" }
    sequence(:cns) { |n| "MyString#{n}" }
    sequence(:email) { |n| "MyString#{n}@email.com" }
    birth_date { "2023-03-17" }
    sequence(:phone_number) { |n| "MyString#{n}" }
    status { 'active' }
  end
end
