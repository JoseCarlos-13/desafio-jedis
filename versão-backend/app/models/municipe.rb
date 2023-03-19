class Municipe < ApplicationRecord
  has_one :address, dependent: :destroy

  validates :full_name, :cpf, :cns, :email, :birth_date, 
            :phone_number, presence: true
  validates :email, :phone_number, :cpf, :cns, uniqueness: true
  validates :email, email: true

  enum status: { active: 0, inactive: 1 }

  has_one_attached :photo

  accepts_nested_attributes_for :address

  def photo_url
    photo_url = rails_blob_path(self.photo, only_path: true)

    "#{ENV['BASE_URL']}#{photo_url}" if self.photo.attached?
  end
end
