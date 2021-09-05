class Api::V1::TehsilsController < ApiController
  include Concerns::UserAuthentication

  def index
  	tehsil_names = []
  	Tehsil.all.each do |tehsil|
  		tehsil_names.push({id: tehsil.id, name: tehsil.name})
  	end

	json = {
		"tehsil_names": tehsil_names
	}

    success(json)
  end
end

