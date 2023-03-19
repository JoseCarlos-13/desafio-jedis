class Address < ApplicationRecord
  belongs_to :municipe

  validates :cep, :public_place, :city, :uf, :neighborhood, presence: true
end
