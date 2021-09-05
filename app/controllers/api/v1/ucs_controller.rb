class Api::V1::UcsController < ApiController
  include Concerns::UserAuthentication
  before_action :set_tehsil, only: [:index]

  def index
  	json = {}
  	uc_names = []

  	@tehsil.ucs.all.each do |uc|
  		uc_names.push({id: uc.id, name: uc.name, session_type: uc.session_type, last_visit_date: uc.last_visit_date || "", last_visit_by: uc.last_visit_by, already_visit: uc.already_visit})
  	end

	json = {
		"uc_names": uc_names
	}

    success(json)
  end

  private

  def set_tehsil
  	@tehsil = Tehsil.find_by(id: params[:tehsil_id])
  end

end
