class Address < ApplicationRecord
  belongs_to :municipe

  validates :cep, presence: true
  validates :public_place, presence: true
  validates :city, presence: true
  validates :uf, presence: true
  validates :neighborhood, presence: true
end
