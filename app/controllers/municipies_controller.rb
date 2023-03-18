class MunicipiesController < ApplicationController
  before_action :set_municipe, only: %i[update show]

  def index
    municipies = Municipe::FilterMunicipies.new(params).call

    render json: municipies,
           each_serializer: Index::MunicipiesSerializer,
           status: :ok
  end

  def create
    municipe = Municipe.new(municipe_attributes)

    if municipe.save
      render json: municipe,
             serializer: Create::MunicipiesSerializer,
             status: :created
    else
      render json: { errors: municipe.errors.messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @municipe.update(municipe_attributes)
      head :no_content
    else
      render json: { errors: @municipe.errors.messages },
             status: :unprocessable_entity
    end
  end

  def show
    render json: @municipe,
           serializer: Show::MunicipiesSerializer,
           status: :ok
  end

  private

  def municipe_attributes
    params.require(:municipe)
          .permit(:full_name, :cpf, :cns, :email, :status, :birth_date,
                  :phone_number,
                  address_attributes: %i[id cep public_place complement city uf
                                         ibge_code municipe_id neighborhood])
  end

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

end
