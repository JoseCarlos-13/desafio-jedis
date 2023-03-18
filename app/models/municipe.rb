class Municipe < ApplicationRecord
  has_one :address, dependent: :destroy

  validates :full_name, presence: true
  validates :cpf, presence: true
  validates :cns, presence: true
  validates :email, presence: true
  validates :birth_date, presence: true
  validates :phone_number, presence: true

  enum status: { active: 0, inactive: 1 }

  accepts_nested_attributes_for :address
end
