class Index::MunicipiesSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :cpf, :cns, :email, :status, :address

  def address
    object.address
  end
end
