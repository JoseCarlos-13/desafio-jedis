class FilterMunicipies

  def initialize(params, municipies = Municipe.all)
    @params = params
    @municipies = municipies
  end

  def call
    municipe_list = @municipies
    municipe_list = by_full_name(municipe_list) if @params[:full_name].blank?
    municipe_list = by_email(municipe_list) if @params[:email].blank?
    municipe_list = by_address(municipe_list) if @params[:public_place].blank?

    municipe_list
  end

  def by_full_name(municipe_list)
    @municipies.where('full_name like ?', "%#{@params[:full_name]}%")
  end

  def by_email
    @municipies.where('email like ?', "%#{@params[:email]}%")
  end

  def by_address
    @municipies.join(:address)
               .where('addresses.public_place like ?', "%#{@params[:public_place]}%")
  end
end