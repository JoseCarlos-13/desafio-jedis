class MunicipiesQuery
  def initialize(params, municipies = Municipe.all)
    @params = params
    @municipies = municipies
  end

  def call
    municipe_list = @municipies
    municipe_list = by_full_name(municipe_list) if @params[:full_name].present?
    municipe_list = by_email(municipe_list) if @params[:email].present?
    municipe_list = by_address(municipe_list) if @params[:address].present?

    municipe_list
  end

  def by_full_name(municipe_list)
    municipe_list.where('full_name like ?', "%#{@params[:full_name]}%")
  end

  def by_email(municipe_list)
    municipe_list.where('email like ?', "%#{@params[:email]}%")
  end

  def by_address(municipe_list)
    municipe_list.joins(:address)
                 .where('public_place like ?', "%#{@params[:address]}%")
  end
end