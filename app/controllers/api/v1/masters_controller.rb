class Api::V1::MastersController < ApiController
  include Concerns::UserAuthentication
  before_action :set_uc, only: [:index]

  def index
 #    json = {
	#   "vaccinator_name": "Hafiz",
	#   "health_facility_name": "Facility 1",
	#   "current_month_data": [
	#     {
	#       "label": "Model Town",
	#       "percent": "20%",
	#       "date": "24-03-2021",
	#       "already_visit": "true"
	#     },
	#     {
	#       "label": "Luban Wala",
	#       "percent": "20%",
	#       "date": "30-08-2021",
	#       "already_visit": "false"
	#     },
	#     {
	#       "label": "Mandili",
	#       "percent": "11%",
	#       "date": "24-03-2021",
	#       "already_visit": "false"
	#     },
	#    	{
	#       "label": "Model Town",
	#       "percent": "20%",
	#       "date": "24-03-2021",
	#       "already_visit": "true"
	#     },
	#     {
	#       "label": "Luban Wala",
	#       "percent": "20%",
	#       "date": "30-08-2021",
	#       "already_visit": "false"
	#     },
	#     {
	#       "label": "Mandili",
	#       "percent": "11%",
	#       "date": "24-03-2021",
	#       "already_visit": "false"
	#     },
	#    	{
	#       "label": "Model Town",
	#       "percent": "20%",
	#       "date": "24-03-2021",
	#       "already_visit": "true"
	#     },
	#     {
	#       "label": "Luban Wala",
	#       "percent": "20%",
	#       "date": "30-08-2021",
	#       "already_visit": "false"
	#     },
	#     {
	#       "label": "Mandili",
	#       "percent": "11%",
	#       "date": "24-03-2021",
	#       "already_visit": "false"
	#     },
	#    	{
	#       "label": "Model Town",
	#       "percent": "20%",
	#       "date": "24-03-2021",
	#       "already_visit": "true"
	#     },
	#     {
	#       "label": "Luban Wala",
	#       "percent": "20%",
	#       "date": "30-08-2021",
	#       "already_visit": "false"
	#     },
	#     {
	#       "label": "Mandili",
	#       "percent": "11%",
	#       "date": "24-03-2021",
	#       "already_visit": "false"
	#     }
	#   ]
	# }



	current_month_data_array = []
	@uc.master_plans.each do |mp|
		current_month_data_array.push(
		    {
		      "label": mp.name,
		      "percent": mp.percent.to_s + "%",
		      "date": mp.plan_date.strftime("%d-%m-%Y"),
		      "already_visit": mp.already_visit
		    }
	    )
	end

    json = {
	  "vaccinator_name": @uc.vaccinator_name,
	  "health_facility_name": @uc.health_facility_name,
	  "current_month_data": current_month_data_array
	}

    success(json)
  end

  private

  def set_uc
  	@uc = Uc.find_by(id: params[:uc_id])
  end

end
