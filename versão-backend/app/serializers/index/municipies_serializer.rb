class Index::MunicipiesSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :cpf, :cns, :email, :status, :address, :photo

  def address
    object.address
  end

  def photo
    object.photo_url
  end
end
