class Show::MunicipiesSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :cpf, :cns, :email, :status, :phone_number,
             :birth_date, :address

  def address
    object.address
  end
end
