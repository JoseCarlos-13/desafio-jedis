FactoryBot.define do
  factory :municipe do
    sequence(:full_name) { |n| "full_name#{n}" }
    sequence(:cpf) { |n| "1231231231#{n}" }
    sequence(:cns) { |n| "MyString#{n}" }
    sequence(:email) { |n| "MyString#{n}@email.com" }
    birth_date { "2023-03-17" }
    sequence(:phone_number) { |n| "MyString#{n}" }
    status { 'active' }
    photo { Rack::Test::UploadedFile.new('app/assets/images/ruby_symbol.png', 'image/png') }
  end
end
