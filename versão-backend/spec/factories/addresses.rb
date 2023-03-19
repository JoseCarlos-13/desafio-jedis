FactoryBot.define do
  factory :address do
    cep { "MyString" }
    public_place { "public_place" }
    complement { "MyString" }
    city { "MyString" }
    uf { "MyString" }
    ibge_code { "MyString" }
    municipe { nil }
    neighborhood { "MyString" }
  end
end
