FactoryBot.define do
  factory :municipe do
    full_name { "MyString" }
    sequence(:cpf) { |n| "MyString#{1}" }
    cns { "MyString" }
    sequence(:email) { |n| "MyString#{1}" }
    birth_date { "2023-03-17" }
    phone_number { "MyString" }
    status { 'active' }
  end
end
